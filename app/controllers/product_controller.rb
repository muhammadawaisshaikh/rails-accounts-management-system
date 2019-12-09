class ProductController < ApplicationController

  def get_vendors
    @vendors = Vendor.all.order(id: :asc)
  end

  def index
    @products = Product.all.order(id: :asc)
    @vendors = Vendor.select("*").joins(:products)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    get_vendors

    @product = Product.new
  end

  def create
    @product = Product.new(params_product)

    if @product.save
        redirect_to product_index_path
    else
        render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
      if @product.update(params_product)
        redirect_to product_index_path
      else
        render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to product_index_path
  end

  private

  def params_product
    params.require(:product).permit(:name, :stock, :retailPrice, :vendor_id)
  end

end
