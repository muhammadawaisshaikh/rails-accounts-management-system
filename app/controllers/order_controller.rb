class OrderController < ApplicationController

  def search
    @search = params["search"]
    if @search.present?
      @mobile = @search["mobile"]
      @name = @search["name"]
      @orders = Order.where("mobile ILIKE ? AND name ILIKE ?", "%#{@mobile}%", "%#{@name}%")
    end
  end

  def index
    @orders = Order.all.order(id: :asc)

    search    
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params_order)

    if @order.save
        redirect_to order_index_path
    else
        render 'new'
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
      if @order.update(params_order)
        redirect_to order_index_path
      else
        render 'edit'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to order_index_path
  end

  private

  def params_order
    params.require(:order).permit(:name, :mobile, :amount, :description, :date, :status, :paymentStatus, :product_id, :vendor_id)
  end

end
