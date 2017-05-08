Rails.application.routes.draw do
  

  #get 'influencer/index'
  get 'influencer', to: 'influencer#index'

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
end
