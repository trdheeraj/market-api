class SupplierSerializer < ActiveModel::Serializer
  attributes :id, :name, :mobile, :email, :tin_number, :gst_number

  has_one :address
  has_many :purchase_invoices
  has_many :purchase_orders
	has_many :supplier_transactions
end
