class Api::V1::EventsController < ApiController
  respond_to :json

  def show
    respond_with Event.find(params[:id])
  end

  def index
    events = Event.all
    render json: events
  end

  private

  def event_params
    params.require(:event).permit(
      :artist, :ticket_url, :dates, :price, :genre, :address, :time, :venue, :featured
    )
  end
end
