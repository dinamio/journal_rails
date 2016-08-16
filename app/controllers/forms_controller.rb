class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]

  # GET /forms
  # GET /forms.json
  def index
    @forms = Form.all
    respond_to do |format|
        format.html
        format.js
    end
  end

  # GET /forms/1
  # GET /forms/1.json
  def show
  end

  # GET /forms/new
  def new
    @form = Form.new
  end

  # GET /forms/1/edit
  def edit
  end

  # POST /forms
  # POST /forms.json
  def create
    @form = Form.new(form_params)

    respond_to do |format|
      if @form.save
        format.html { redirect_to forms_path, notice: 'Класс успешно создан.' }
        format.json { render :show, status: :created, location: @form }
      else
        format.html { render :new }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forms/1
  # PATCH/PUT /forms/1.json
  def update
    respond_to do |format|
      if @form.update(form_params)
        format.html { redirect_to forms_path, notice: 'Класс успешно обновлен.' }
        format.json { render :show, status: :ok, location: @form }
      else
        format.html { render :edit }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1
  # DELETE /forms/1.json
  def destroy
    @form.destroy
    respond_to do |format|
      format.html { redirect_to forms_url, notice: 'Класс успешно удален.' }
      format.json { head :no_content }
    end
  end

  def edit_subjects
    @form = Form.find(params[:form_id])
  end

  def save_subjects
    @form = Form.find(params[:form_id])
    subjects = params[:form][:subject_ids]
    subjects.each do |subject_id|
      if (subject_id != '' && (@form.subjects.where(id: subject_id).first == nil))
        
        subject = Subject.find(subject_id)
        @form.subjects.push(subject)
        puts subject  
      end
    end
    respond_to do |format|
      if @form.save
        format.html { redirect_to forms_path, notice: 'Предметы класса успешно обновлены.' }
        format.json { render :show, status: :created, location: @form }
      else
        format.html { render :new }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_params
      params.require(:form).permit(:name)
    end
end
