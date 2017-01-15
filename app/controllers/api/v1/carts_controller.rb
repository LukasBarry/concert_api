class Api::V1::CartsController < ApiController
  respond_to :json

  def show
    respond_with Cart.find(params[:id])
  end

  private

  def cart_params
    params.require(:cart).permit(:user_id)
  end
end
