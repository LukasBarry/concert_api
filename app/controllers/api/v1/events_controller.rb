class Api::V1::EventsController < ApiController
  respond_to :json

  def show
    respond_with Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :url, :location, :dates, :price, :info, :genre, :address, :city, :tags)
  end
end
