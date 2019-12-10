class SalesController < ApplicationController
  def index
    @vendors = Vendor.select("*").joins(:orders).group('orders.id', 'vendors.id');

    @sumTotal = Order.sum("amount");
    @completedTotal = Order.where("status = 'Completed'").sum("amount");
    @pendingTotal = Order.where("status = 'Pending'").sum("amount");
    @shippedTotal = Order.where("status = 'Shipped'").sum("amount");
    @returnedTotal = Order.where("status = 'Returned'").sum("amount");
    @canceledTotal = Order.where("status = 'Canceled'").sum("amount");
  end
end
