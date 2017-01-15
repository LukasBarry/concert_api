class Api::V1::LineItemsController < ApiController
  respond_to :json

  def show
    respond_with LineItem.find(params[:id])
  end

  private

  def line_item_params
    params.require(:line_item).permit(:ticket_id, :cart_id, :quantity)
  end
end
