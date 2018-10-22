module Api::V1
  class SuppliersController < ApplicationController
    before_action :set_supplier, only: [:update, :show, :destroy]

    def index
      @suppliers = Supplier.all
      render json: @suppliers, status: 200
    end

    def create
      @supplier = Supplier.new(supplier_params)
      @address = Address.create(address_params)
      @supplier.address = @address
      @supplier.save!
      render json: @supplier, status: 200
    end

    def update
      @supplier.update_attributes(supplier_params)
      @supplier.address.update_attributes(address_params)
      render json: @supplier, status: 200
    end

    def show
      render json: @supplier, status: 200
    end

    def destroy
      if @supplier.destroy
        head :no_content, status: :ok
      else
        render json: @supplier.errors, status: :unprocessable_entity
      end
    end

    private
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    def supplier_params
      params.require(:supplier).permit(:name, :mobile, :email, :tin_number, :gst_number)
    end

    def address_params
      params.require(:address).permit(Address.column_names)
    end
  end
end