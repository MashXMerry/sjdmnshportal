class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  # GET /students
  # GET /students.json
  def index
    @student = Student.new
    @grades = Grade.all
    @sections7 = Section.all.where(:yearlvl => 7)
    @sections8 = Section.all.where(:yearlvl => 8)
    @sections9 = Section.all.where(:yearlvl => 9)
    @sections10 = Section.all.where(:yearlvl => 10)
    @sections11 = Section.all.where(:yearlvl => 11)
    @sections12 = Section.all.where(:yearlvl => 12)
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @grades = Grading.where(:student_id => @student_id).order('subject ASC')
      @grades.each do |grade|
        @grade1 = grade.grade
      end  
    @grade1st = Grading.where(:quarter => 1 , :student_id => @student.id).order('subject ASC')
    @grade2nd = Grading.where(:quarter => 2 , :student_id => @student.id).order('subject ASC')
    @grade3rd = Grading.where(:quarter => 3 , :student_id => @student.id).order('subject ASC')
    @grade4th = Grading.where(:quarter => 4 , :student_id => @student.id).order('subject ASC')
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    @sections7 = Section.all.where(:yearlvl => 7)
    @sections8 = Section.all.where(:yearlvl => 8)
    @sections9 = Section.all.where(:yearlvl => 9)
    @sections10 = Section.all.where(:yearlvl => 10)
    @sections11 = Section.all.where(:yearlvl => 11)
    @sections12 = Section.all.where(:yearlvl => 12)
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)


    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
        format.js
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update_status
    respond_to do |format|
      if Student.update(:status => 'un-enrolled')
        format.html { redirect_to admin_profile_path , notice: 'Enrolled Students reset' }  
      else
        format.html { redirect_to admin_profile_path , notice: 'Failed to Reset enrollment' }
      end
    end
  end

  def enrollagain
    # @student = Student.find_by(params[:id])
    # @student.status = 'enrolled'
    # @student.save
  end

  def reset
    # @student = Student.find(params[:id])
    @grades = Grading.all.where(:student_id => @student)
    @grades.destroy_all
    redirect_to request.referrer
    # respond_to do |format|
    #   format.html { redirect_to request.referrer , notice: 'Grades successfully reset' }
    #   format.js
    # end  
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to admin_student_list_path , notice: 'Student was successfully removed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:firstname, :lastname, :password, :lrn, :section, :level, :gender, :email , :middlename , :phone_number , :slug , :status)
    end
end
