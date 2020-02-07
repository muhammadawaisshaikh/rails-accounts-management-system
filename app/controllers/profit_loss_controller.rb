class ProfitLossController < ApplicationController
  def search
    @search = params["search"]
    if @search.present?
      @mobile = @search["mobile"]
      @name = @search["name"]
      @orders = Vendor.select("*").joins(products: [:orders]).where("orders.status = 'Completed' AND name ILIKE ?", "%#{@name}%").paginate(page: params[:page], per_page: 20)

      @profit = 0;
      @profit1 = Vendor.select("*").joins(products: [:orders]).where("orders.status = 'Completed' AND name ILIKE ?", "%#{@name}%").sum("amount");
    end
  end

  def date_wise
    @date_search = params["date_wise"]
    if @date_search.present?
      @date_from = @date_search["date_from"]
      @date_to = @date_search["date_to"]
      
      @orders = Product.select("*").joins(:orders).where(:created_at => @date_from..@date_to).paginate(page: params[:page], per_page: 20)
      @profit = 0;
      @profit1 = Product.select("*").joins(:orders).where(:created_at => @date_from..@date_to).sum("amount");
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
    date_wise
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
