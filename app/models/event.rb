class Event
  include Mongoid::Document
  field :artist,       type: String
  field :ticket_url, type: String
  field :dates,      type: String
  field :price,      type: Integer
  field :genre,      type: String
  field :address,    type: String
  field :artist,     type: String
  field :time,       type: String
  field :venue,      type: String
  field :featured,   type: Boolean

  has_many :tickets

  validates :name, presence: true, uniqueness: true
end
