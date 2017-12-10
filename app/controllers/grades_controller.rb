class GradesController < ApplicationController
	before_action :find_student, only: [:edit]

	def create
	  @student = Student.find(params[:student_id])
	  @grades = @student.grades.create(params[:grade].permit(:subject, :quarter, :grade))
	  redirect_to @student
	end

	def destroy
	  @student = Student.find(params[:student_id])
	  @grade = @student.grades.find(grade_params)
	  	if @grades.destoy
	  	  redirect_to @student
	  	else
	  	  redirect_to @student
	  	end  	
	end

	def update
	  	@grades.update(grade_params)
	  	redirect_to @students
	end

	def edit
	  @student = Student.find(params[:student_id])
	  @grades = Grade.where(:student_id => @student)
	end

	protected

	def find_student
	  @student = Student.find(params[:id])
	end

	def grade_params
	  params.require(:grade).permit(:subject , :grade, :quarter)
	end
end
