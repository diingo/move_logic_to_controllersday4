class ProductsController < ApplicationController
  def index
    @products = Product.includes(:user).all

    respond_to do |format|
      format.html #show default view
      format.json {render json: @products}
      format.xml {render xml: @products}
    end
  end

  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save #if this was able to be saved successfully
        format.html {render action: "create"}
        format.json {render json: @product}
      else
        format.html { render action: "new" }
        format.json {render json: @product.errors, status: :unprocessable_entity}
      end
    end
  end
end
