class PaymentController < ApplicationController

  def search
  end

  def index
    @payments = Payment.all.order(id: :asc)

    @all = Payment.all.count;

    search    
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(params_payment)

    if @payment.save
        redirect_to payment_index_path
    else
        render 'new'
    end
  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def update
    @payment = Payment.find(params[:id])
      if @payment.update(params_payment)
        redirect_to payment_index_path
      else
        render 'edit'
    end
  end

  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
    redirect_to payment_index_path
  end

  private

  def params_payment
    params.require(:payment).permit(:date, :type, :toFrom, :amount, :status)
  end
end
