module Api::V1
  class PurchaseInvoicesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_purchase_invoices, only: [:update, :show, :destroy]

    def index
      begin
        @purchase_invoices = PurchaseInvoice.all
        render json: @purchase_invoices, status: 200
      rescue => exception
        render json: { errors: exception }
      end
    end

    def create
      @current_invoice_amount = 0
      begin
        PurchaseInvoice.transaction do
          @purchase_invoice = PurchaseInvoice.new(purchase_invoice_params)
          @purchase_invoice.save!
          create_update_product_and_orders(product_list_params)
          create_supplier_transaction
          render json: @purchase_invoice, status: 200
        end
      rescue => exception
        render json: { errors: exception }
      end
    end

    def show
      render json: @purchase_invoice, status: 200
    end

    def destroy
      if @purchase_invoices.destroy
        head :no_content, status: :ok
      else
        render json: @purchase_invoices.errors, status: :unprocessable_entity
      end
    end

    private
    def set_purchase_invoice
      begin
        @purchase_invoice = PurchaseInvoice.find(params[:id])
      rescue => exception
        render json: { errors: exception }
      end
    end

    def purchase_invoice_params
      params.require(:purchase_invoice).permit(:bill_number, :supplier_id, :date, :discount, :payment_type, :amount, :product_list)
    end

    def product_list_params
      params.require(:product_list)
    end

    def create_update_product_and_orders(product_detail_list)
      product_detail_list.each do |product_detail|
        product = Product.find_by(name: product_detail[:name], hsn: product_detail[:hsn])
        product = product ? product.update!(quantity: product.quantity + product_detail[:quantity]) : Product.create!(product_detail)
        PurchaseOrder.create!(purchase_invoice_id: @purchase_invoice.id, product_id: product.id, quantity: product_detail[:quantity])
        @current_invoice_amount += (product.rate * product_detail[:quantity])
      end
    end

    def create_supplier_transaction
      supplier_current_balance_amount = SupplierTransaction.where(supplier_id: @purchase_invoice.supplier_id).order("created_at DESC").first
      SupplierTransaction.create!({
        supplier_id: @purchase_invoice.supplier_id,
        date: @purchase_invoice.date,
        payment_type: @purchase_invoice.payment_type,
        amount: @purchase_invoice.amount,
        balance_amount: supplier_current_balance_amount + (@current_invoice_amount - @purchase_invoice.amount),
        purchase_invoice_id: @purchase_invoice.id
      })
    end
  end
end