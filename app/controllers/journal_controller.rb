class JournalController < ApplicationController
  def index
    @journals = Journal.all
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
  end

  def destroy
  end

  private

  def params_journal
      params.require(:journal).permit(:reference, :date, :summary, :amount)
  end

end
