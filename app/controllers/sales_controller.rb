class SalesController < ApplicationController
  def index
    @orders = Vendor.select("*").joins(:orders).group('orders.id', 'vendors.id').paginate(page: params[:page], per_page: 10);

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
      @vendor_name = @search["vendor_name"]
      @orders = Vendor.select("*").joins(:orders).where("vendor_name ILIKE ?", "%#{@vendor_name}%")

      @sumTotal = Vendor.select("*").joins(:orders).where("vendor_name ILIKE ?", "%#{@vendor_name}%").sum("amount");
      @completedTotal = Vendor.select("*").joins(:orders).where("vendor_name ILIKE ?", "%#{@vendor_name}% AND status = 'Completed'").sum("amount");
      @pendingTotal = Vendor.select("*").joins(:orders).where("vendor_name ILIKE ?", "%#{@vendor_name}% AND status = 'Pending'").sum("amount");
      @shippedTotal = Vendor.select("*").joins(:orders).where("vendor_name ILIKE ?", "%#{@vendor_name}% AND status = 'Shipped'").sum("amount");
      @returnedTotal = Vendor.select("*").joins(:orders).where("vendor_name ILIKE ?", "%#{@vendor_name}% AND status = 'Returned'").sum("amount");
      @canceledTotal = Vendor.select("*").joins(:orders).where("vendor_name ILIKE ?", "%#{@vendor_name}% AND status = 'Canceled'").sum("amount");
    end
  end

end
