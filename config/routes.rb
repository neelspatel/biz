Biz::Application.routes.draw do
  get "pages/home"

  devise_for :merchants

  #root :to => "home#index"
  root :to => 'pages#home'
  
  resources :widgets, :only => [:create, :destroy, :show]
  resources :items, :only => [:create, :destroy, :show]


end
