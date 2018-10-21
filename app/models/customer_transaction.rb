class CustomerTransaction < ApplicationRecord
	belongs_to :customer
	belongs_to :sales_invoice

	validates :customer_id, presence: true
	validates :date, presence: true
	validates :payment_type, presence: true
	validates :amount, presence: true
	validates :balance_amount, presence: true
end