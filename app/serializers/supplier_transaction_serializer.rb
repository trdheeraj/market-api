class SupplierTransactionSerializer < ActiveModel::Serializer
  attributes :id, :supplier_id, :date, :payment_type, :amount, :balance_amount

  has_one :supplier
  has_one :purchase_invoice
end
