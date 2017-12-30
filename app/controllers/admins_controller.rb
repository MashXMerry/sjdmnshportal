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

    @student7 = Student.all.where(:level => 7)
    @student8 = Student.all.where(:level => 8)
    @student9 = Student.all.where(:level => 9)
    @student10 = Student.all.where(:level => 10)
    @student11 = Student.all.where(:level => 11)
    @student12 = Student.all.where(:level => 12)

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
      @students = Student.all.where(:section => section.section)
      @students.each do |student|
        @subjects = Subject.all.where(:yearlvl => student.level)
        @grading = Grading.new
      end
    end
  end

  def grades
  	
  end

  def profile
  	@admin = Administrator.where(id: current_administrator.id)
    @section = Section.where(:adviser_id => current_administrator.id)
  end

  def registeradmin
    @administrators = Administrator.new
    @admins = Administrator.all
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

  def grade7
  end

  def grade8
  end

  def grade9
  end

  def grade10
  end

  def grade11 
  end

  def grade12
  end

  def subjectlist
    
  end

  private

  def admin_params
  	params.require(:administrator).permit(:firstname, :lastname , :email , :password , :middlename , :role)
  end

end
