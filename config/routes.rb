Rails.application.routes.draw do

  

  get 'demo/index'
  
  get 'demo', to: 'demo#index'

  #get 'experiences/index'
  
  #get 'experiences', to: 'experiences#index'

  get 'professionals/index'

  get 'professionals', to: 'professionals#index'

  root 'pages#home'
  #root 'home#index'

  devise_for :users, 
  			 :path => '', 
  			 :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
  			 :controllers => {:omniauth_callbacks => 'omniauth_callbacks',
  			 				  :registrations => 'registrations'
  			 				 }
  resources :users, only: [:show]
  resources :experiences
  resources :expphotos
  resources :activities

  resources :experiences do 
    resources :reservations, only: [:create]
    resources :activities
  end



  get '/your_itineraries' => 'reservations#your_itineraries'
  get '/your_listings' => 'experiences#your_listings'
end
