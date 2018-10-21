class SupplierTransaction < ApplicationRecord
	belongs_to :supplier
	belongs_to :purchase_invoice

	validates :supplier_id, presence: true
	validates :date, presence: true
	validates :payment_type, presence: true
	validates :amount, presence: true
	validates :balance_amount, presence: true
end