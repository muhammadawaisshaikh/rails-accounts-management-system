class ProductController < ApplicationController
  include ProductHelper

  def get_vendors
    @vendors = Vendor.all.order(id: :asc)
  end

  def search
    @search = params["search"]
    if @search.present?
      @vendor_name = @search["vendor_name"]
      @name = @search["name"]
      @vendors = Vendor.select("*").joins(:products).where("vendor_name ILIKE ? AND product_name ILIKE ?", "%#{@vendor_name}%", "%#{@name}%")

      @all = Vendor.select("*").joins(:products).where("vendor_name ILIKE ? AND product_name ILIKE ?", "%#{@vendor_name}%", "%#{@name}%").count;
    end
  end

  def index
    @products = Product.all.order(id: :asc).paginate(page: params[:page], per_page: 20)
    @vendors = Vendor.select("*").joins(:products).paginate(page: params[:page], per_page: 20)

    @all = Vendor.select("*").joins(:products).count;

    search
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
    params.require(:product).permit(:product_name, :stock, :retailPrice, :vendor_id)
  end

end
