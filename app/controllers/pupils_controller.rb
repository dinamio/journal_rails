class PupilsController < ApplicationController
  before_action :set_pupil, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET form/:form_id/pupils
  # GET form/:form_id/pupils.json
  def index
    @form = Form.find(params[:form_id])
    @pupils = @form.pupils
  end

  # GET /pupils/1
  # GET /pupils/1.json
  def show
  end

  # GET /pupils/new
  def new
    @form = Form.find(params[:form_id])
    @pupil = Pupil.new
  end

  # GET /pupils/1/edit
  def edit
    @form = Form.find(params[:form_id])
    @pupil = Pupil.find(params[:id])
  end

  # POST /pupils
  # POST /pupils.json
  def create
    @pupil = Pupil.new(pupil_params)
    @form = Form.find(params[:form_id])
    @pupil.form = @form
    respond_to do |format|
      if @pupil.save
        format.html { redirect_to form_pupils_path(@form), notice: 'Ученик успешно добавлен.' }
        format.json { render :show, status: :created, location: @pupil }
      else
        format.html { render :new }
        format.json { render json: @pupil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pupils/1
  # PATCH/PUT /pupils/1.json
  def update
    @form = Form.find(params[:form_id])
    respond_to do |format|
      if @pupil.update(pupil_params)
        format.html { redirect_to form_pupils_path(@form), notice: 'Данные ученика изменены.' }
        format.json { render :show, status: :ok, location: @pupil }
      else
        format.html { render :edit }
        format.json { render json: @pupil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pupils/1
  # DELETE /pupils/1.json
  def destroy
    @pupil.destroy
    @form = Form.find(params[:form_id])
    respond_to do |format|
      format.html { redirect_to form_pupils_path(@form), notice: 'Ученик удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pupil
      @pupil = Pupil.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pupil_params
      params.require(:pupil).permit(:name,:surname)
    end
end
