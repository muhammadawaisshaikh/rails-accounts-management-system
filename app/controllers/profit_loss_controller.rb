class ProfitLossController < ApplicationController
  def search
    @search = params["search"]
    if @search.present?
      @mobile = @search["mobile"]
      @name = @search["name"]
      @orders = Vendor.select("*").joins(products: [:orders]).where("orders.status = 'Completed' AND name ILIKE ?", "%#{@name}%")

      @profit = Vendor.select("*").joins(products: [:orders]).where("orders.status = 'Completed' AND name ILIKE ?", "%#{@name}%").sum("amount");
      @loss = Vendor.select("*").joins(products: [:orders]).where("orders.status = 'Completed' AND name ILIKE ?", "%#{@name}%").sum("amount");
    end
  end

  def index
    @orders = Vendor.select("*").joins(products: [:orders]).where("orders.status = 'Completed'").order(id: :asc)

    @profit = Vendor.select("*").joins(products: [:orders]).sum("amount");
    @loss = Order.where(:status => 'Completed').sum("amount");

    search    
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
