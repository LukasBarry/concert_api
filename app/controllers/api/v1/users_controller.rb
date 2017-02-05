class Api::V1::UsersController < ApiController
  respond_to :json

  def show
    respond_with User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(
      :email, :password, :name, :country_code, :phone_number, :authy_id,
      :verified
    )
  end
end
