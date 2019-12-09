class DashboardController < ApplicationController
  def index
    @orders = Order.all.order(id: :asc)

    @suppliers = Vendor.all.count

    @all = Order.all.count;
    @pending = Order.where(:status => 'Pending').count;
    @shipped = Order.where(:status => 'Shipped').count;
    @completed = Order.where(:status => 'Completed').count;
    @returned = Order.where(:status => 'Returned').count;
    @canceled = Order.where(:status => 'Canceled').count;
  end
end
