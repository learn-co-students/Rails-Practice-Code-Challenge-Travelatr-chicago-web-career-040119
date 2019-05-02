Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers
  resources :posts
  patch "posts", action: :like, controller: "posts"
  resources :destinations

end
