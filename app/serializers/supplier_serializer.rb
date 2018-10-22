class SupplierSerializer < ActiveModel::Serializer
  attributes :id, :name, :mobile, :email, :tin_number, :gst_number

  has_one :address
end
