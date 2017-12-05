class GradesController < ApplicationController
	def create
	  @student = Student.find(params[:student_id])
	  @grades = @student.grades.create(params[:grade].permit(:subject, :quarter, :grade))
	  redirect_to @student
	end

	def destroy
	  @student = Student.find(params[:student_id])
	  @grades = @student.grades.find(grade_params)
	  	if @grades.destoy
	  	  redirect_to @student
	  	else
	  	  redirect_to @student
	  	end  	
	end

	def update
		
	end

	def edit
		
	end

	protected

	def grade_params
	  params.require(:grade).permit(:subject , :grade, :quarter)
	end
end
