class Api::V1::NewProductsController < ApplicationController
  def index
    @new_products = NewProduct.all
    render json: @new_products, each_serializer: NewProductSerializer
  end
end
