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

  def destroy
    @journal = ClassJournal.find(params[:id])
    @journal.destroy
    respond_to do |format|
      format.html { redirect_to class_journal_url, notice: 'Журнал успешно удален.' }
      format.json { head :no_content }
    end
  end

  def journal_table
    @journal = ClassJournal.find(params[:class_journal_id])
    @pupils = @journal.form.pupils
    @lessons = @journal.lessons
  end

  def journal_change
    @journal = ClassJournal.find(params[:class_journal_id])
    @lessons = @journal.lessons
    req = params[:data] 
    @row_id = req.keys[0]
    pupil_id = @row_id.split('_')[1]
    @pupil = Pupil.find(pupil_id)
    lesson_id = req[@row_id].keys[0].split('_')[1]
    lesson = Lesson.find(lesson_id)
    mark = Mark.new
    mark.lesson = lesson
    mark.pupil = @pupil
    mark.mark = req[@row_id].values[0]
    mark.save
  end
end
