class PaymentController < ApplicationController

  def search
    @search = params["search"]
    if @search.present?
      @to_from = @search["to_from"]
      @status = @search["status"]
      @payments = Payment.where("to_from ILIKE ? AND status ILIKE ?", "%#{@to_from}%", "%#{@status}%")

      @all = Payment.where("to_from ILIKE ? AND status ILIKE ?", "%#{@to_from}%", "%#{@status}%").count;
      @allCredit = Payment.select("*").where("to_from ILIKE ? AND status = 'Credit' ", "%#{@to_from}%").count;
      @allDebit = Payment.select("*").where("to_from ILIKE ? AND status = 'Debit' ", "%#{@to_from}%").count;
    end
  end

  def index
    @payments = Payment.all.order(id: :asc)

    @all = Payment.all.count;
    @allCredit = Payment.all.where(:status => 'Credit').count;
    @allDebit = Payment.all.where(:status => 'Debit').count;

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
    params.require(:payment).permit(:date, :purpose, :to_from, :amount, :status)
  end
end
