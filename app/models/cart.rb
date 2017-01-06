class Cart
  include Mongoid::Document
  field :user_id, type: Integer

  validates :user, presence: true
  belongs_to :user

  def subtotal
    line_items.to_a.sum { |item| item.total_price }
  end

  def add_ticket(ticket_id)
    current_item = line_items.find_by(ticket_id: ticket_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(ticket_id: ticket_id)
    end
    current_item
  end
end
