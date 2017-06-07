Rails.application.routes.draw do

  root 'pages#home'

  devise_for 	:users, 
  						:path => '', 
  						:path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
  						:controllers => {:omniauth_callbacks => 'omniauth_callbacks',
  														 :registrations => 'registrations'
  														}

  resources :users, only: [:show]
  resources :rooms
  resources :photos
  resources :experiences
  resources :expphotos

  resources :rooms do
    resources :reservations, only: [:create]
  end

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  resources :rooms do
    resources :reviews, only: [:create, :destroy]
  end

  resources :actphotos
  resources :activities

  resources :experiences do 
    resources :expreservations, only: [:create]
    resources :activities
  end

  resources :professionals, only: [:index, :show] do
    post 'submit_application', on: :member
    get 'apply', on: :member
  end

  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'

  get '/your_trips' => 'reservations#your_trips'
  get '/your_reservations' => 'reservations#your_reservations'

  post '/notify' => 'reservations#notify'
  post '/your_trips' => 'reservations#your_trips'

  get '/exp_your_itineraries' => 'expreservations#exp_your_itineraries'

  post '/exp_notify' => 'expreservations#exp_notify'
  post '/exp_your_itineraries' => 'expreservations#exp_your_itineraries'
  

  get '/search' => 'pages#search'
  get '/homes' => 'pages#homes'

end
