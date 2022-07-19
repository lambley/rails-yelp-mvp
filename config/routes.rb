Rails.application.routes.draw do
  resources :restaurants, only: %i[index show new create] do
    resources :reviews, only: [:create]
  end
  resources :reviews, only: %i[index show]
end
