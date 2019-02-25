class SalesInvoice < ApplicationRecord
	belongs_to :customer
	has_many :sales_orders
	has_one :customer_transaction

	validates :bill_number, presence: true
	validates :customer_id, presence: true
	validates :date, presence: true
	validates :payment_type, presence: true
	validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end