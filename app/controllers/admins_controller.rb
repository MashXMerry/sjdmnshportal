class AdminsController < ApplicationController
  before_action :authenticate_administrator!

  def dashboard
  	@news = News.all.order('created_at DESC').limit(3)
  	@events = Event.all.order('created_at DESC').limit(3)
  	@announcements = Announcement.all.order('created_at DESC').limit(3)

    @news1 = News.all
    @events1 = Event.all
    @announcements1 = Announcement.all
  end

  def grades
  	
  end

  def profile
  	@admin = Administrator.where(id: current_administrator.id)
  end

  def registeradmin
    @administrators = Administrator.new
    @admins = Administrator.all

    @admins.each do |admin|
      firstname = admin.firstname
      lastname = admin.lastname
      @section = Section.all.where("adviser LIKE ? ? ", firstname , lastname)
    end

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
    @students = Student.where(["lrn LIKE?" , "%#{params[:search]}%"]).order('level ASC').order('lastname ASC')
    @student7 = Student.all.where(level: 7)
    @student8 = Student.all.where(level: 8)
    @student9 = Student.all.where(level: 9)
    @student10 = Student.all.where(level: 10)
    @student11 = Student.all.where(level: 11)
    @student12 = Student.all.where(level: 12)
  end

  def grade7
    @student = Student.where(["firtname LIKE ?","%#{params[:search]}%" ])
    @students7A = Student.all.where(section: "NARRA" , level: 7)
    @students7B = Student.all.where(section: "ACACIA" , level: 7)
    @students7C = Student.all.where(section: "MULAWIN" , level: 7)
    @students7D = Student.all.where(section: "APITONG" , level: 7)
    @students7E = Student.all.where(section: "YAKAL" , level: 7)
    @students7F = Student.all.where(section: "MAHOGANY" , level: 7)
    @students7G = Student.all.where(section: "TALISAY" , level: 7)
    @students7H = Student.all.where(section: "IPIL-IPIL" , level: 7)
    @students7I = Student.all.where(section: "CAMACHILE" , level: 7)
    @students7J = Student.all.where(section: "DUHAT" , level: 7)
    @students7K = Student.all.where(section: "KAMAGONG" , level: 7)
    @students7L = Student.all.where(section: "SAMPALOK" , level: 7)
    @students7M = Student.all.where(section: "MANGGA" , level: 7)
    @students7N = Student.all.where(section: "AVOCADO" , level: 7)
  end

  def grade8
    @students8 = Student.all.where(level: 8)
    @students8A = Student.all.where(section: "CHARITY" , level: 8)
    @students8B = Student.all.where(section: "HOPE" , level: 8)
    @students8C = Student.all.where(section: "LOVE" , level: 8)
    @students8D = Student.all.where(section: "PATIENCE" , level: 8)
    @students8E = Student.all.where(section: "FREEDOM" , level: 8)
    @students8F = Student.all.where(section: "FAITH" , level: 8)
    @students8G = Student.all.where(section: "PEACE" , level: 8)
    @students8H = Student.all.where(section: "SINCERITY" , level: 8)
    @students8I = Student.all.where(section: "GOODWILL" , level: 8)
    @students8J = Student.all.where(section: "JUSTICE" , level: 8)
    @students8K = Student.all.where(section: "UNITY" , level: 8)
    @students8L = Student.all.where(section: "OBEDIENCE" , level: 8)
    @students8M = Student.all.where(section: "PRUDENCE" , level: 8)
    @students8N = Student.all.where(section: "HONESTY" , level: 8)
  end

  def grade9
    @students9 = Student.all.where(level: 9)
    @students9A = Student.all.where(section: "SAMPAGUITA" , level: 9)
    @students9B = Student.all.where(section: "ROSE" , level: 9)
    @students9C = Student.all.where(section: "GUMAMELA" , level: 9)
    @students9D = Student.all.where(section: "ILANG-ILANG" , level: 9)
    @students9E = Student.all.where(section: "DAISY" , level: 9)
    @students9F = Student.all.where(section: "GLADIOLA" , level: 9)
    @students9G = Student.all.where(section: "CATLEYA" , level: 9)
    @students9H = Student.all.where(section: "LIRIO" , level: 9)
    @students9I = Student.all.where(section: "MAGNOLIA" , level: 9)
    @students9J = Student.all.where(section: "CARNATION" , level: 9)
    @students9K = Student.all.where(section: "LOTUS" , level: 9)
    @students9L = Student.all.where(section: "CAMIA" , level: 9)
  end

  def grade10
    @students10 = Student.all.where(level: 10)
    @students10A = Student.all.where(section: "GENESIS" , level: 10)
    @students10B = Student.all.where(section: "EXODUS" , level: 10)
    @students10C = Student.all.where(section: "AWIT" , level: 10)
    @students10D = Student.all.where(section: "LEVITICO" , level: 10)
    @students10E = Student.all.where(section: "KAWIKAAN" , level: 10)
    @students10F = Student.all.where(section: "CRONICA" , level: 10)
    @students10G = Student.all.where(section: "JEREMIAH" , level: 10)
    @students10H = Student.all.where(section: "JOSHUA" , level: 10)
    @students10I = Student.all.where(section: "ISAIAH" , level: 10)
    @students10J = Student.all.where(section: "EZEKIEL" , level: 10)
    @students10K = Student.all.where(section: "DANIEL" , level: 10)
    @students10L = Student.all.where(section: "AMOS" , level: 10)
  end

  def grade11
    @students11 = Student.all.where(level: 11)
    @students11A = Student.all.where(section: "HERMES" , level: 11)
    @students11B = Student.all.where(section: "ATHENA" , level: 11)
    @students11C = Student.all.where(section: "HERA" , level: 11)
    @students11D = Student.all.where(section: "DEMETER" , level: 11)
    @students11E = Student.all.where(section: "CERRIDWEN" , level: 11)
    @students11F = Student.all.where(section: "HERCULES" , level: 11)
    @students11G = Student.all.where(section: "IRIS" , level: 11) 
    @students11H = Student.all.where(section: "POSEIDON" , level: 11) 
    @students11I = Student.all.where(section: "APOLLO" , level: 11) 
    @students11J = Student.all.where(section: "HESPHAESTUS" , level: 11) 
    @students11K = Student.all.where(section: "VENUS" , level: 11)  
  end

  def grade12
    @students12 = Student.all.where(level: 12)
    @students12A = Student.all.where(section: "RUBY" , level: 12)
    @students12B = Student.all.where(section: "JADE" , level: 12)
    @students12C = Student.all.where(section: "EMERALD" , level: 12)
    @students12D = Student.all.where(section: "DIAMOND" , level: 12)
    @students12E = Student.all.where(section: "PERIDOT" , level: 12)
    @students12F = Student.all.where(section: "GARNET" , level: 12)
    @students12G = Student.all.where(section: "AMETHYST" , level: 12)
    @students12H = Student.all.where(section: "AQUAMARINE" , level: 12)
    @students12I = Student.all.where(section: "PEARL" , level: 12)
    @students12J = Student.all.where(section: "SAPHIRE" , level: 12)
    @students12K = Student.all.where(section: "OPAL" , level: 12)
    @students12L = Student.all.where(section: "TOPAZ" , level: 12)
    @students12M = Student.all.where(section: "AMBER" , level: 12)
  end

  def subjectlist
    
  end

  private

  def admin_params
  	params.require(:administrator).permit(:firstname, :lastname , :email , :password , :middlename , :role)
  end

end
