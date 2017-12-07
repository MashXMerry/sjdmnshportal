class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @student = Student.new
  end

  # GET /students/1
  # GET /students/1.json
  def show
     @student = Student.find(params[:id])
     @subjects1 = Grade.all.where(:quarter => 1 , :student_id => @student ).order('subject ASC').order('created_at ASC')
     @subjects2 = Grade.all.where(:quarter => 2 , :student_id => @student ).order('subject ASC').order('created_at ASC')
     @subjects3 = Grade.all.where(:quarter => 3 , :student_id => @student ).order('subject ASC').order('created_at ASC')
     @subjects4 = Grade.all.where(:quarter => 4 , :student_id => @student ).order('subject ASC').order('created_at ASC')
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
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
      params.require(:student).permit(:firstname, :lastname, :password, :lrn, :section, :level, :gender, :email , :middlename)
    end
end
