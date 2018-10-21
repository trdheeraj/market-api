class Customer < ApplicationRecord
	belongs_to :address, dependent: :destroy

	has_many :sales_invoices
	has_many :customer_transactions

	validates :name, presence: true,
			  uniqueness: { case_sensitive: false },
			  length: { minimum: 3, maximum: 25 }
	validates :address_id, presence: true,
			  uniqueness: true
	validates :mobile, presence: true,
			  uniqueness: true,
			  numericality: true,
			  length: { minimum: 10, maximum: 15 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
			  length: { maximum: 105 },
			  uniqueness: { case_sensitive: false },
			  format: { with: VALID_EMAIL_REGEX }
end