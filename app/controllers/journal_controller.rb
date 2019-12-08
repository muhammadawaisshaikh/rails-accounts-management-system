class JournalController < ApplicationController
  def index
    @journals = Journal.all.order(id: :asc)
  end

  def show
    @journal = Journal.find(params[:id])
  end

  def new
    @journal = Journal.new
  end

  def create
    @journal = Journal.new(params_journal)

    if @journal.save
        redirect_to journal_index_path
    else
        render 'new'
    end
  end

  def edit
    @journal = Journal.find(params[:id])
  end

  def update
    @journal = Journal.find(params[:id])
      if @journal.update(params_journal)
        redirect_to journal_index_path
      else
        render 'edit'
    end
  end

  def destroy
    @journal = Journal.find(params[:id])
    @journal.destroy
    redirect_to journal_index_path
  end

  private

  def params_journal
      params.require(:journal).permit(:reference, :date, :summary, :amount)
  end

end
