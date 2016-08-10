class ClassJournalController < ApplicationController
  def index
  	@journals = ClassJournal.all
    respond_to do |format|
        format.html 
      end
  end

  def show
  	@journal = ClassJournal.find(params[:id])
  	@pupils = @journal.form.pupils
    @lessons = @journal.lessons
  end
end
