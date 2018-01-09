class AdminsController < ApplicationController
  before_action :authenticate_administrator!

  def dashboard
  	@news = News.all.order('created_at DESC').limit(3)
  	@events = Event.all.order('created_at DESC').limit(3)
  	@announcements = Announcement.all.order('created_at DESC').limit(3)

    @administrators = Administrator.all
    @sections = Section.all
    @student = Student.all
    @news1 = News.all
    @events1 = Event.all
    @announcements1 = Announcement.all

    @student7 = Student.all.where(:level => 7 , :status => "enrolled")
    @student8 = Student.all.where(:level => 8 , :status => "enrolled")
    @student9 = Student.all.where(:level => 9 , :status => "enrolled")
    @student10 = Student.all.where(:level => 10 , :status => "enrolled")
    @student11 = Student.all.where(:level => 11 , :status => "enrolled")
    @student12 = Student.all.where(:level => 12 , :status => "enrolled")

    @Ustudent7 = Student.all.where(:level => 7 , :status => "un-enrolled")
    @Ustudent8 = Student.all.where(:level => 8 , :status => "un-enrolled")
    @Ustudent9 = Student.all.where(:level => 9 , :status => "un-enrolled")
    @Ustudent10 = Student.all.where(:level => 10 , :status => "un-enrolled")
    @Ustudent11 = Student.all.where(:level => 11 , :status => "un-enrolled")
    @Ustudent12 = Student.all.where(:level => 12 , :status => "un-enrolled")

    @Dstudent7 = Student.all.where(:level => 7 , :status => "dropped")
    @Dstudent8 = Student.all.where(:level => 8 , :status => "dropped")
    @Dstudent9 = Student.all.where(:level => 9 , :status => "dropped")
    @Dstudent10 = Student.all.where(:level => 10 , :status => "dropped")
    @Dstudent11 = Student.all.where(:level => 11 , :status => "dropped")
    @Dstudent12 = Student.all.where(:level => 12 , :status => "dropped")

    @grade7 = Section.all.where(:yearlvl => 7)
    @grade8 = Section.all.where(:yearlvl => 8)
    @grade9 = Section.all.where(:yearlvl => 9)
    @grade10 = Section.all.where(:yearlvl => 10)
    @grade11 = Section.all.where(:yearlvl => 11)
    @grade12 = Section.all.where(:yearlvl => 12)
  end

  def myclass
    @sections = Section.all.where(:adviser_id => current_administrator.id)
    @students1 = Student.all.where(:section => @sections , :status => 'enrolled')
    @sections.each do |section|
      @students = Student.all.where(:section => section.section , :status => 'enrolled').order('lastname , gender ASC')
    end
  end

  def mygrade
    @grading = Grade.new
    @sections = Section.all.where(:adviser_id => current_administrator.id)
    @students1 = Student.all.where(:section => @sections)
    @sections.each do |section|
      @students = Student.all.where(:section => section.section , :status => 'enrolled')
      @students.each do |student|
        @subjects = Subject.all.where(:yearlvl => student.level)
        @grading = Grading.new
      end
    end
  end

  def delete_account
    @admin = Administrator.find(params[:id])
    @admin.destroy
    respond_to do |format|
      if @admin.destroy
        format.html { redirect_to admin_register_path , notice: "User account succesfully removed" }
      else
        format.html { redirect_to admin_register_path , notice: "User account failed to remove" }
      end
    end
  end

  def grades
  	
  end

  def adminAcount
    @admin = Administrator.find(params[:id])
    @section = Section.where(:adviser_id => @admin.id)
    @section.each do |section|
      @studentSection = section.section
    end
    @studentsF = Student.all.where(:section => @studentSection , :gender => 'female').order('firstname ASC')
    @studentsM = Student.all.where(:section => @studentSection , :gender => 'male').order('firstname ASC')
  end

  def profile
  	@admin = Administrator.where(id: current_administrator.id)
    @section = Section.where(:adviser_id => current_administrator.id)
  end

  def registeradmin
    @administrators = Administrator.new
    @admins = Administrator.all.order('lastname ASC')
  end

  def addadministrator
    @admin = Administrator.create(admin_params)
    respond_to do |format|
      if @admin.save
        format.html { redirect_to admin_register_path, notice: 'Successfully registered.' }
      else
        format.html { redirect_to admin_register_path, notice: 'Register Failed' }
      end
    end
  end

  def remove_account
    @admin = Admin.find(params[:id])
    @admin.destroy
    redirect_to admin_profile_path
  end

  def student_list
    # @student = Student.friendly.find(params[:id])
    @students = Student.where(["lrn LIKE?" , "%#{params[:search]}%"]).order('level ASC').order('lastname ASC')
    @student7 = Student.all.where(level: 7 , :status => "enrolled").order('section ASC').order('gender DESC')
    @student8 = Student.all.where(level: 8 , :status => "enrolled").order('section ASC').order('gender DESC')
    @student9 = Student.all.where(level: 9 , :status => "enrolled").order('section ASC').order('gender DESC')
    @student10 = Student.all.where(level: 10 , :status => "enrolled").order('section ASC').order('gender DESC')
    @student11 = Student.all.where(level: 11 , :status => "enrolled").order('section ASC').order('gender DESC')
    @student12 = Student.all.where(level: 12 , :status => "enrolled").order('section ASC').order('gender DESC')
  end

  def unregistered
    @students = Student.where(["lrn LIKE?" , "%#{params[:search]}%"]).order('level ASC').order('lastname ASC')
    notenrolled = ["un-enrolled" , "dropped"]
    @student7 = Student.all.where(level: 7 , :status => notenrolled).order('section ASC').order('gender DESC')
    @student8 = Student.all.where(level: 8 , :status => notenrolled).order('section ASC').order('gender DESC')
    @student9 = Student.all.where(level: 9 , :status => notenrolled).order('section ASC').order('gender DESC')
    @student10 = Student.all.where(level: 10 , :status => notenrolled).order('section ASC').order('gender DESC')
    @student11 = Student.all.where(level: 11 , :status => notenrolled).order('section ASC').order('gender DESC')
    @student12 = Student.all.where(level: 12 , :status => notenrolled).order('section ASC').order('gender DESC')
  end

  def enrollstudent
    
  end

  def search_student
    @students = Student.where(["lrn LIKE?" , "%#{params[:search]}%"]).order('level ASC').order('lastname ASC')
  end

  def setAvailable
    @adviser = Administrator.find(params[:id])
    @adviser.update(:available => 'not-available')
    @adviser.save
  end

  def setNotAvailable
    @adviser = Administrator.find(params[:id])
    @adviser.update(:available => 'available')
    @adviser.save 
  end

  def resetSectionAdviser
    @admin = Administrator.all.where(:role => "faculty")
    @admin.update(:available => "available")
    @section = Section.all
    respond_to do |format|
      if @section.update(:adviser => "" , :adviser_id => "")
        format.html { redirect_to admin_profile_path , notice: "Section advisers reset succesfully" }
      else
        format.html { redirect_to admin_profile_path , notice: "Reset failed" }
      end  
    end
  end


  private

  def admin_params
  	params.require(:administrator).permit(:firstname, :lastname , :email , :password , :middlename , :role , :username , :available)
  end

end
