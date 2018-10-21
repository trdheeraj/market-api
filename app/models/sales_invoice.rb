class SalesInvoice < ApplicationRecord
	belongs_to :customer
	has_many :sales_orders
	has_many :customer_transactions

	validates :bill_number, presence: true
	validates :customer_id, presence: true
	validates :date, presence: true
	validates :payment_type, presence: true
	validates :amount, presence: true
end