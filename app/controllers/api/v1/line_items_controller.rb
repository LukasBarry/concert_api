class Api::V1::LineItemsController < ApiController
  respond_to :json

  def show
    respond_with LineItem.find(params[:id])
  end
end
