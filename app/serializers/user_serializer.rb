class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :name, :country_code, :phone_number, :authy_id,
  :verified
end
