class Api::V1::TicketsController < ApiController
  respond_to :json

  def show
    respond_with Ticket.find(params[:id])
  end
end
