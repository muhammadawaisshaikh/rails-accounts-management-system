class DashboardController < ApplicationController
  def index
    @orders = Order.all.order(id: :asc)

    @suppliers = Vendor.all.count
    @products = Product.all.count

    # payments
    @allCount = Payment.all.count;
    @allSum = Payment.all.sum(:amount);
    @allCreditCount = Payment.all.where(:status => 'Credit').count;
    @allCreditSum = Payment.all.where(:status => 'Credit').sum(:amount);
    @allDebitCount = Payment.all.where(:status => 'Debit').count;
    @allDebitSum = Payment.all.where(:status => 'Debit').sum(:amount);

    # orders statistics 
    @all = Order.all.count;
    @pending = Order.where(:status => 'Pending').count;
    @shipped = Order.where(:status => 'Shipped').count;
    @completed = Order.where(:status => 'Completed').count;
    @returned = Order.where(:status => 'Returned').count;
    @canceled = Order.where(:status => 'Canceled').count;

    # sales statistics 
    @sumTotal = Order.sum("amount");
    @completedTotal = Order.where("status = 'Completed'").sum("amount");
    @pendingTotal = Order.where("status = 'Pending'").sum("amount");
    @shippedTotal = Order.where("status = 'Shipped'").sum("amount");
    @returnedTotal = Order.where("status = 'Returned'").sum("amount");
    @canceledTotal = Order.where("status = 'Canceled'").sum("amount");

  end
end
