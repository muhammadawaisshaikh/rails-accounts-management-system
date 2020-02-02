class SalesController < ApplicationController
  def index
    @orders = Product.select("*").joins(:orders).group('orders.id', 'products.id').paginate(page: params[:page], per_page: 10);

    @sumTotal = Order.sum("amount");
    @completedTotal = Order.where("status = 'Completed'").sum("amount");
    @pendingTotal = Order.where("status = 'Pending'").sum("amount");
    @shippedTotal = Order.where("status = 'Shipped'").sum("amount");
    @returnedTotal = Order.where("status = 'Returned'").sum("amount");
    @canceledTotal = Order.where("status = 'Canceled'").sum("amount");

    # seach method calling
    search
  end

  def search
    @search = params["search"]
    if @search.present?
      @product_name = @search["product_name"]
      @orders = Product.select("*").joins(:orders).where("product_name ILIKE ?", "%#{@product_name}%")

      @sumTotal = Product.select("*").joins(:orders).where("product_name ILIKE ?", "%#{@product_name}%").sum("amount");
      @completedTotal = Product.select("*").joins(:orders).where("product_name ILIKE ?", "%#{@product_name}% AND status = 'Completed'").sum("amount");
      @pendingTotal = Product.select("*").joins(:orders).where("product_name ILIKE ?", "%#{@product_name}% AND status = 'Pending'").sum("amount");
      @shippedTotal = Product.select("*").joins(:orders).where("product_name ILIKE ?", "%#{@product_name}% AND status = 'Shipped'").sum("amount");
      @returnedTotal = Product.select("*").joins(:orders).where("product_name ILIKE ?", "%#{@product_name}% AND status = 'Returned'").sum("amount");
      @canceledTotal = Product.select("*").joins(:orders).where("product_name ILIKE ?", "%#{@product_name}% AND status = 'Canceled'").sum("amount");
    end
  end

end
