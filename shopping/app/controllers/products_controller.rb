class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destory
    Product.find(params[:id]).destroy
    redirect_to root_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :detail, :image)
  end
end
