class SalesOrderSerializer < ActiveModel::Serializer
  attributes :id, :sales_invoice_id, :product_id, :quantity

  has_one :product
  has_one :sales_invoice
end
