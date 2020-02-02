class PaymentController < ApplicationController

  def search
    @search = params["search"]
    if @search.present?
      @to_from = @search["to_from"]
      @status = @search["status"]
      @payments = Payment.where("to_from ILIKE ? AND status ILIKE ?", "%#{@to_from}%", "%#{@status}%")

      @allCount = Payment.where("to_from ILIKE ? AND status ILIKE ?", "%#{@to_from}%", "%#{@status}%").count;
      @allSum = Payment.where("to_from ILIKE ? AND status ILIKE ?", "%#{@to_from}%", "%#{@status}%").sum(:amount);
      @allCreditCount = Payment.select("*").where("to_from ILIKE ? AND status = 'Credit' ", "%#{@to_from}%").count;
      @allCreditSum = Payment.select("*").where("to_from ILIKE ? AND status = 'Credit' ", "%#{@to_from}%").sum(:amount);
      @allDebitCount = Payment.select("*").where("to_from ILIKE ? AND status = 'Debit' ", "%#{@to_from}%").count;
      @allDebitSum = Payment.select("*").where("to_from ILIKE ? AND status = 'Debit' ", "%#{@to_from}%").sum(:amount);
    end
  end

  def index
    @payments = Payment.all.order(id: :asc).paginate(page: params[:page], per_page: 20)

    @allCount = Payment.all.count;
    @allSum = Payment.all.sum(:amount);
    @allCreditCount = Payment.all.where(:status => 'Credit').count;
    @allCreditSum = Payment.all.where(:status => 'Credit').sum(:amount);
    @allDebitCount = Payment.all.where(:status => 'Debit').count;
    @allDebitSum = Payment.all.where(:status => 'Debit').sum(:amount);

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
