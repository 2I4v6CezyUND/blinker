Rails.application.routes.draw do
  resources :model_variants
  resources :models
  resources :makes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
