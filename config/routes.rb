Rails.application.routes.draw do
  get 'contact' => 'mainpages#contact'
  get 'sessions/new'
  
  get 'users' => 'users#index'

  get 'sign' => 'users#new'

  get 'home' => 'mainpages#home'

  get 'about' => 'mainpages#about'

  root 'mainpages#home'

  get 'show' =>'users#show'

  get    'login'   => 'sessions#new'

  post   'login'   => 'sessions#create'

  delete 'logout'  => 'sessions#destroy'

  resources :users
  resources :microposts, only: [:create, :destroy]
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
