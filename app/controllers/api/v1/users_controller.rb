class Api::V1::UsersController < ApiController
  respond_to :json

  def show
    respond_with User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      # Save the user_id to the session object
      session[:user_id] = user.id

      # Create user on Authy, will return an id on the object
      authy = Authy::API.register_user(
        email: user.email,
        cellphone: user.phone_number,
        country_code: user.country_code
      )
      user.update(authy_id: authy.id)

      # Send an SMS to your user
      Authy::API.request_sms(id: user.authy_id)

      redirect_to api_verify_path
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def show_verify
    return redirect_to new_api_user_path unless session[:user_id]
  end

  def verify
    user = User.find(params[:id])

    # Use Authy to send the verification token
    token = Authy::API.verify(id: user.authy_id, token: params[:token])

    if token.ok?
      # Mark the user as verified for get /user/:id
      user.update(verified: true)

      # Send an SMS to the user 'success'
      send_message("You did it! Signup complete!")

      # Show the user profile
      redirect_to api_user_path(user.id)
    else
      flash.now[:danger] = "Incorrect code, please try again"
      render :show_verify
    end
  end

  def resend
    user = User.find(params[:id])
    Authy::API.request_sms(id: user.authy_id)
    flash[:notice] = 'Verification code re-sent'
    redirect_to api_verify_path
  end

  private

  def send_message(message)
    user = User.find(params[:id])
    twilio_number = ENV['TWILIO_NUMBER']
    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    message = client.messages.create(
      from: twilio_number,
      to:   "+#{user.country_code}#{user.phone_number}",
      body: message
    )
  end

  def user_params
    params.require(:user).permit(
      :email, :password, :name, :country_code, :phone_number, :authy_id,
      :verified
    )
  end
end
