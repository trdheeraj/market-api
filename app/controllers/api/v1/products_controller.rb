module Api::V1
  class ProductsController < ApplicationController
    before_action :authenticate_user!

    # Returns the All product details
    def index
      begin
        @products = Product.all
        render json: @products, status: 200
      rescue => exception
        render json: { errors: exception }
      end
    end

    # Returns the All product name as an array
    def name_list
      begin
        @products = Product.pluck(:name)
        render json: { names: @products }, status: 200
      rescue => exception
        render json: { errors: exception }
      end
    end
  end
end