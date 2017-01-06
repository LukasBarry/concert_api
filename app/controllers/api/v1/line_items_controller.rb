class Api::V1::LineItemsController < ApplicationController
  respond_to :json

  def show
    respond_with LineItem.find(params[:id])
  end
end
