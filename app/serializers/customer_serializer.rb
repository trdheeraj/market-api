class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :mobile, :email

  has_one :address
end
