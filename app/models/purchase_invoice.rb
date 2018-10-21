class PurchaseInvoice < ApplicationRecord
	belongs_to :supplier
	has_many :purchase_orders
	has_many :supplier_transactions

	validates :bill_number, presence: true
	validates :supplier_id, presence: true
	validates :date, presence: true
	validates :payment_type, presence: true
	validates :amount, presence: true
end