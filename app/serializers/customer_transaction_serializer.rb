class CustomerTransactionSerializer < ActiveModel::Serializer
  attributes :id, :customer_id, :date, :payment_type, :amount, :balance_amount

  has_one :customer
  has_one :sales_invoice
end
