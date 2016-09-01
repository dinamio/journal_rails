class ClassJournalController < ApplicationController
  before_filter :authenticate_user!
  before_filter do 
    render :text => 'Not Found', :status => '404' unless current_user && current_user.admin?
  end
  def index
  	@journals = ClassJournal.all
    respond_to do |format|
        format.html 
      end
  end

  def show
  	@journal = ClassJournal.find(params[:id])
  	@pupils = @journal.form.pupils.order(:surname)
    @lessons = @journal.lessons.order(:date)
    Pupil.fill_pupils(@pupils)
  end

  def destroy
    @journal = ClassJournal.find(params[:id])
    @journal.destroy
    respond_to do |format|
      format.html { redirect_to class_journal_index_path, notice: 'Журнал успешно удален.' }
      format.json { head :no_content }
    end
  end

  def journal_table
    @journal = ClassJournal.find(params[:class_journal_id])
    @pupils = @journal.form.pupils.order(:surname)
    @lessons = @journal.lessons
    Pupil.fill_pupils(@pupils)
  end

  def journal_change
    @journal = ClassJournal.find(params[:class_journal_id])
    @lessons = @journal.lessons
    pupil_id = params[:pk].split('_')[1]
    @pupil = Pupil.find_by_id(pupil_id)
    lesson_id = params[:pk].split('_')[0]
    lesson = Lesson.find(lesson_id)
    mark = Mark.new
    mark.lesson = lesson
    mark.pupil = @pupil
    mark.mark = params[:value]
    mark.save
  end

  
end
