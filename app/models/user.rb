class User
  include Mongoid::Document
  field :email,        type: String
  field :name,         type: String
  field :country_code, type: Integer
  field :phone_number, type: Integer
  field :password,     type: String
  field :authy_id,     type: String
  field :verified,     type: Boolean

  # has_secure_password
  has_one :cart

  validates :email,  presence: true, format: { with: /\A.+@.+$\Z/ }, uniqueness: true
  validates :name, presence: true
  validates :country_code, presence: true
  validates :phone_number, presence: true, uniqueness: true
end
