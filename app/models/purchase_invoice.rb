class PurchaseInvoice < ApplicationRecord
	belongs_to :supplier
	has_many :purchase_orders
	has_one :supplier_transaction

	validates :bill_number, presence: true
	validates :supplier_id, presence: true
	validates :date, presence: true
	validates :payment_type, presence: true
	validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end