class SalesInvoiceSerializer < ActiveModel::Serializer
  attributes :id, :bill_number, :customer_id, :date, :payment_type, :amount

  has_many :sales_orders
  has_one :customer_transaction
end
