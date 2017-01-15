class TicketsController < ApplicationController
  include CurrentCart
  before_action :find_cart, only: [:line_item_create]

  def show
  end

  def index
  end

  def line_item_create
    ticket = Ticket.find(params[:ticket_id])
    @line_item = @cart.add_ticket(ticket.id)
    if @line_item.save
      redirect_to cart_path(@line_item.cart)
    else
      redirect_to @ticket
    end
  end

  private

  def line_item_params
    params.require(:line_item).permit(:cart_id, :price, :event_id)
  end
end
