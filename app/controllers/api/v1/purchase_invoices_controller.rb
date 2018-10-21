module Api::V1
  class PurchaseInvoicesController < ApplicationController
    before_action :set_purchase_invoices, only: [:update, :show, :destroy]

    def index
      @purchase_invoices = PurchaseInvoice.all
      render json: @purchase_invoices
    end

    def create
      @purchase_invoice = PurchaseInvoice.new(purchase_invoice_params)
      @purchase_invoice.save!
      render json: @purchase_invoice
    end

    def update
    end

    def show
      render json: @purchase_invoice
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
      @purchase_invoice = PurchaseInvoice.find(params[:id])
    end

    def purchase_invoice_params
      params.require(:purchase_invoice).permit(:bill_number, :supplier_id, :date, :discount, :payment_type, :amount)
    end
  end
end