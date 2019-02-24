module Api::V1
  class SalesInvoicesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_sales_invoices, only: [:update, :show, :destroy]

    def index
      begin
        @sales_invoices = SalesInvoice.all
        render json: @sales_invoices, status: 200
      rescue => exception
        render json: { errors: exception }
      end
    end

    def create
      @current_invoice_amount = 0
      begin
        SalesInvoice.transaction do
          @sales_invoice = SalesInvoice.new(sales_invoice_params)
          @sales_invoice.save!
          create_update_product_and_orders(product_list_params)
          create_customer_transaction
          render json: @sales_invoice, status: 200
        end
      rescue => exception
        render json: { errors: exception }
      end
    end

    def show
      render json: @sales_invoice, status: 200
    end

    def destroy
      if @sales_invoices.destroy
        head :no_content, status: :ok
      else
        render json: @sales_invoices.errors, status: :unprocessable_entity
      end
    end

    private
    def set_sales_invoice
      begin
        @sales_invoice = SalesInvoice.find(params[:id])
      rescue => exception
        render json: { errors: exception }
      end
    end

    def sales_invoice_params
      params.require(:sales_invoice).permit(:bill_number, :customer_id, :date, :discount, :payment_type, :amount)
    end

    def product_list_params
      params.require(:product_list)
    end

    def create_update_product_and_orders(product_detail_list)
      product_detail_list.each do |product_detail|
        product = Product.where('lower(name) = ? and hsn = ?', product_detail[:name].downcase, product_detail[:hsn]).first
        if product
          product.update!(quantity: product.quantity - product_detail[:quantity])
        end
        product = Product.where('lower(name) = ? and hsn = ?', product_detail[:name].downcase, product_detail[:hsn]).first
        SalesOrder.create!(sales_invoice_id: @sales_invoice.id, product_id: product.id, quantity: product_detail[:quantity])
        @current_invoice_amount += (product.rate * product_detail[:quantity])
      end
    end

    def create_customer_transaction
      customer_current_balance_amount = CustomerTransaction.where(customer_id: @sales_invoice.customer_id).order("created_at DESC").first
      CustomerTransaction.create!({
        customer_id: @sales_invoice.customer_id,
        date: @sales_invoice.date,
        payment_type: @sales_invoice.payment_type,
        amount: @sales_invoice.amount,
        balance_amount: customer_current_balance_amount.to_f + (@current_invoice_amount - @sales_invoice.amount),
        sales_invoice_id: @sales_invoice.id
      })
    end
  end
end