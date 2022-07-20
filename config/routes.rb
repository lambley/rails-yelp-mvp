Rails.application.routes.draw do
  resources :restaurants, only: %i[index show new create] do
    resources :reviews, only: %i[index show create]
  end
end
