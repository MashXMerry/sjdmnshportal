class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  # GET /sections
  # GET /sections.json
  def index
    @sections = Section.all
    @section = Section.new
    @teacher = Administrator.all.where(:role => "faculty")
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
  end

  # GET /sections/new
  def new
    @section = Section.new
  end

  def sectionlist
    @students = Student.all
    @section7 = Section.all.where(:yearlvl => 7).order('yearlvl ASC').order('section ASC')
    @section8 = Section.all.where(:yearlvl => 8).order('yearlvl ASC').order('section ASC')
    @section9 = Section.all.where(:yearlvl => 9).order('yearlvl ASC').order('section ASC')
    @section10 = Section.all.where(:yearlvl => 10).order('yearlvl ASC').order('section ASC')
    @section11 = Section.all.where(:yearlvl => 11).order('yearlvl ASC').order('section ASC')
    @section12 = Section.all.where(:yearlvl => 12).order('yearlvl ASC').order('section ASC')
  end

  # GET /sections/1/edit
  def edit
    # @section = Section.all.where(:adviser_id => nil)
    @sections = Section.all
    @sections.each do |section|
      @adviser_id = section.adviser_id.blank?
    end  
    @teacher = Administrator.all.where(:role => "faculty" , :available => 'available').order('lastname DESC')
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to @section, notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
        format.js
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to sectionlist_path, notice: "Section successfully updated." }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to sections_url, notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:section, :yearlvl, :adviser , :adviser_id)
    end
end
