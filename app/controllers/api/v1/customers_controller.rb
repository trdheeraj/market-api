module Api::V1
  class CustomersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_customer, only: [:update, :show, :destroy]

    def index
      begin
        @customers = Customer.all
        render json: @customers, status: 200
      rescue => exception
        render json: { errors: exception }
      end
    end

    def create
      begin
        @customer = Customer.new(customer_params)
        @address = Address.create(address_params)
        @customer.address = @address
        @customer.save!
        render json: @customer, status: 200
      rescue => exception
        render json: { errors: exception }
      end
    end

    def update
      begin
        @customer.update_attributes(customer_params)
        @customer.address.update_attributes(address_params)
        render json: @customer, status: 200
      rescue => exception
        render json: { errors: exception }
      end
    end

    def show
      render json: @customer, status: 200
    end

    def destroy
      if @customer.destroy
        head :no_content, status: :ok
      else
        render json: @customer.errors, status: :unprocessable_entity
      end
    end

    private
    def set_customer
      begin
        @customer = Customer.find(params[:id])
      rescue => exception
        render json: { errors: exception }
      end
    end

    def customer_params
      params.require(:customer).permit(:name, :mobile, :email)
    end

    def address_params
      params.require(:address).permit(Address.column_names)
    end
  end
end