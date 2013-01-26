Biz::Application.routes.draw do
  get "pages/home"
  get "pages/useremulate"
  

  devise_for :merchants

  #root :to => "home#index"
  root :to => 'pages#home'
  
  resources :widgets, :only => [:create, :destroy, :show]
  resources :items, :only => [:create, :destroy, :show]
  resources :chats, :only => [:index, :create, :show]
  resources :answers, :only => [:create, :show, :destroy]


end
