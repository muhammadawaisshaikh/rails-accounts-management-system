class ProfitLossController < ApplicationController
  def search
    @search = params["search"]
    if @search.present?
      @mobile = @search["mobile"]
      @name = @search["name"]
      @orders = Vendor.select("*").joins(products: [:orders]).where("orders.status = 'Completed' AND name ILIKE ?", "%#{@name}%")

      @profit = 0;
      @profit1 = Vendor.select("*").joins(products: [:orders]).where("orders.status = 'Completed' AND name ILIKE ?", "%#{@name}%").sum("amount");
    end
  end

  def profit_calc(orders)
    @orders.each do |order|
      @profit = @profit+(order.amount-(order.quantity*order.retailPrice)) 
    end
    return @profit
  end

  def index
    @orders = Vendor.select("*").joins(products: [:orders]).where("orders.status = 'Completed'").order(id: :asc).paginate(page: params[:page], per_page: 20)

    @profit = 0;
    @profit1 = Vendor.select("*").joins(products: [:orders]).sum("amount");

    search
    profit_calc(@orders)    
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
