class PurchaseOrderSerializer < ActiveModel::Serializer
  attributes :id, :purchase_invoice_id, :product_id, :quantity

  has_one :product
  has_one :purchase_invoice
end
