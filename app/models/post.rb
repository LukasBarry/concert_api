class Post
  include Mongoid::Document
  field :comment, type: String
  field :hype_count, type: Integer
  field :location, type: String
  field :event_id, type: Integer
  field :user_id, type: Integer
end
