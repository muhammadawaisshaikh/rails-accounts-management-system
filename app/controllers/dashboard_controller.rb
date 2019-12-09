class DashboardController < ApplicationController
  def index
    @orders = Order.all.order(id: :asc)

    @suppliers = Vendor.all.count

    @all = Order.all.count;
    @pending = Order.where(:status => 'pending').count;
    @shipped = Order.where(:status => 'shipped').count;
    @completed = Order.where(:status => 'completed').count;
    @returned = Order.where(:status => 'returned').count;
    @canceled = Order.where(:status => 'canceled').count;
  end
end
