Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, only: [:show, :new, :create, :edit, :update] do
    post 'likes_plus_one', to: 'posts#likes_plus_one'
  end
  resources :destinations, only: [:show, :index]
  resources :bloggers, only: [:show, :new, :create, :index]
end
