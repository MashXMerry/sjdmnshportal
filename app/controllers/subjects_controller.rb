class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  def subjectlist
    @subject7 = Subject.all.where(:yearlvl => 7).order('yearlvl ASC')
    @subject8 = Subject.all.where(:yearlvl => 8).order('yearlvl ASC')
    @subject9 = Subject.all.where(:yearlvl => 9).order('yearlvl ASC')
    @subject10 = Subject.all.where(:yearlvl => 10).order('yearlvl ASC')
    @subject11 = Subject.all.where(:yearlvl => 11).order('yearlvl ASC')
    @subject12 = Subject.all.where(:yearlvl => 12).order('yearlvl ASC')
  end

  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all
    @subject = Subject.new
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: 'Subject was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to subjectlist_path, notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjectlist_path, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:title, :description , :yearlvl)
    end
end
