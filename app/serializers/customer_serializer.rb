class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :mobile, :email

  has_one :address
  has_many :sales_invoices
  has_many :sales_orders
	has_many :customer_transactions
end
