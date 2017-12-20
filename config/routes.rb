Rails.application.routes.draw do
  root 'pages#index'

  devise_for :administrators, controllers: {
    sessions: 'administrators/sessions',
    registrations: 'administrators/registrations'
  }
  # json requests
  get '/news/news_json', to: 'pages#news_json'
  get '/announcements/announcements_json', to: 'pages#announcements_json'
  get  '/events/events_json', to: 'pages#events_json'
  get '/administrators/administrators_json' , to: 'pages#admins_json'
  get '/students/students_json' , to: 'pages#students_json'
  get '/grades/grades_json' , to: 'pages#grades_json'
  get '/images/images_json' , to: 'pages#images'

  get 'student/student_json/:id' , to: 'pages#student_id_json'
  get 'student/student_grade_json/:id' , to: 'pages#student_grade_json'

  get '/quarter/first_quarter' , to: 'pages#first_quarter'
  get '/quarter/second_quarter' , to: 'pages#second_quarter'
  get '/quarter/third_quarter' , to: 'pages#third_quarter'
  get '/quarter/fourth_quarter' , to: 'pages#fourth_quarter'

  get 'news' , to: 'pages#news' , as: 'news_page'
  get 'announcements' , to: 'pages#announcements' , as: 'announcement_page'
  get 'events' , to: 'pages#events' , as: 'event_page'
  get 'school' , to: 'pages#school' , as: 'school_page'
  get 'about' , to: 'pages#about' , as: 'about_page'

  scope 'admin' do
    resources :events
    resources :news
    resources :announcements
    resources :sections
    resources :subjects
    resources :gradings
    resources :students do
    # put '/update_grades' , to: 'grades#update' , as: 'update_grades'
    end

    # post '/create_grades' , to: 'grades#create_grades' , as: 'insert_grade'
    get 'search/student' , to: 'admins#search_student' , as: 'search_student'
    get '/myclass' , to: 'admins#myclass' , as: 'myclass'
    get '/grades' , to: 'admins#mygrade' , as: 'mygrades'
    get '/dashboard' , to: 'admins#dashboard' , as: 'admin_dashboard'
    get '/subject_list' , to: 'subjects#subjectlist' , as:'subjectlist'
    get '/section_list' , to: 'sections#sectionlist' , as:'sectionlist'
    get '/grades' , to: 'admins#grades' , as: 'admin_school'
    get '/profile' , to: 'admins#profile' , as: 'admin_profile'
    get 'student_list' , to: 'admins#student_list' , as: 'admin_student_list'
    get '/register_admin' , to: 'admins#registeradmin' , as: 'admin_register'
    post '/add_admin' , to: 'admins#addadministrator' , as: 'add_admin'
    delete '/remove_account' , to: 'admins#remove_account' , as: 'remove_account'
    delete '/reset/grades' , to: 'students#reset' , as: 'reset_grades'

    # # sections

    get '/grade7' , to: 'admins#grade7' , as: 'grade7'
    get '/grade8' , to: 'admins#grade8' , as: 'grade8'
    get '/grade9' , to: 'admins#grade9' , as: 'grade9'
    get '/grade10' , to: 'admins#grade10' , as: 'grade10'
    get '/grade11' , to: 'admins#grade11' , as: 'grade11'
    get '/grade12' , to: 'admins#grade12' , as: 'grade12'
  end

end
