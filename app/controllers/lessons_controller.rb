class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  # GET /lessons
  # GET /lessons.json
  def index
    @journal = ClassJournal.find(params[:class_journal_id])
    @lessons = @journal.lessons.order(:date)

  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
    @journal = ClassJournal.find(params[:class_journal_id])
  end

  # GET /lessons/1/edit
  def edit
    @journal = ClassJournal.find(params[:class_journal_id])
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)
    @journal = ClassJournal.find(params[:class_journal_id])
    @lesson.class_journal = @journal
    respond_to do |format|
      if @lesson.save
        format.html { redirect_to class_journal_lessons_url(@journal), notice: 'Урок успешно создан.' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    @journal = ClassJournal.find(params[:class_journal_id])
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to class_journal_lessons_url(@journal), notice: 'Урок успешно обновлен.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @journal = ClassJournal.find(params[:class_journal_id])
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to class_journal_lessons_url(@journal), notice: 'Урок успешно удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:name, :date, :class_journal_id, :homework)
    end
end
