class PurchaseInvoiceSerializer < ActiveModel::Serializer
  attributes :id, :bill_number, :supplier_id, :date, :payment_type, :amount

  has_many :purchase_orders
  has_one :supplier_transactions
end
