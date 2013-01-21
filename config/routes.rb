Biz::Application.routes.draw do
  get "pages/home"

  devise_for :merchants

  root :to => "home#index"
end
