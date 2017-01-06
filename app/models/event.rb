class Event
  include Mongoid::Document
  field :name, type: String
  field :ticket_url, type: String
  field :location, type: String
  field :dates, type: String
  field :price, type: Integer
  field :info, type: String
  field :genre, type: String
  field :address, type: String
  field :city, type: String
  field :tags, type: String
  field :artist, type: String
  field :time, type: String
  field :venue, type: String

  has_many :tickets

  validates :name, presence: true, uniqueness: true
end
