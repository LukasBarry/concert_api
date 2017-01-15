class Api::V1::UsersController < ApiController
  respond_to :json

  def show
    respond_with User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :mobile_number)
  end
end
