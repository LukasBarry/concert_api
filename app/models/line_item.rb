class LineItem
  include Mongoid::Document
  field :ticket_id, type: Integer
  field :cart_id,   type: Integer
  field :quantity,  type: Integer, default: 1

  validates :cart, presence: true
  validates :ticket, presence: true

  belongs_to :ticket
  belongs_to :cart

  def total_price
    ticket.price * quantity
  end
end
