class PagesController < ApplicationController
  def index
  	
  end
  
  def news_json
    data = News.all.all.order('created_at DESC')
    render :json => {'data'=>data}
  end

  def announcements_json
    data = Announcement.all.order('created_at DESC')
    render :json => { 'data'=>data }
  end

  def events_json
    data = Event.all.all.order('created_at DESC')
    render :json => { 'data'=>data }
  end

  def admins_json
    data = Administrator.all
    render :json => { 'data' => data }
  end

  def students_json
    data = Student.all
    render :json => { 'data' => data }
  end

  def grades_json
    data = Grade.all
    render :json => { 'data' => data }
  end

  def news
    @news = News.all.order('created_at DESC').paginate(page: params[:page] , per_page: 5)
    @events = Event.all.order('created_at DESC').limit(5)
    @announcements = Announcement.all.order('created_at DESC').limit(5)
  end

  def announcements
    @announcements1st = Announcement.last
  	@announcements = Announcement.all.order('created_at DESC').paginate(page: params[:page] , per_page: 3)
    @events = Event.all.order('created_at DESC').limit(5)
    @news = News.all.order('created_at DESC').limit(5)
  end

  def events
  	@events =Event.all.order('created_at DESC').paginate(page: params[:page] , per_page: 5)
    @announcements = Announcement.all.order('created_at DESC').limit(5)
    @news = News.all.order('created_at DESC').limit(5)

    # @eventwphoto = Event.all.where('image_file_name IS NOT NULL')
    @event1st = Event.last
  end

  def about
    
  end
  
end
