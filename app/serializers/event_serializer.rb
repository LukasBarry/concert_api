class EventSerializer < ActiveModel::Serializer
  attributes :id, :artist, :ticket_url, :dates, :price, :genre, :address, :time,
:venue, :featured
end
