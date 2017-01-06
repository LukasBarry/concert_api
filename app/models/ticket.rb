class Ticket
  include Mongoid::Document
  field :price, type: Integer
  field :event_id, type: Integer

  before_destroy :ensure_not_referenced_by_any_line_item

  belongs_to :event
  has_many :line_items

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end
