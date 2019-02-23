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
      begin
        @purchase_invoice = PurchaseInvoice.new(purchase_invoice_params)
        @purchase_invoice.save!
        render json: @purchase_invoice, status: 200
      rescue => exception
        render json: { errors: exception }
      end
    end

    def update
      begin
        @purchase_invoice.update_attributes(purchase_invoice_params)
        render json: @purchase_invoice, status: 200
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
      params.require(:purchase_invoice).permit(:bill_number, :supplier_id, :date, :discount, :payment_type, :amount)
    end
  end
end