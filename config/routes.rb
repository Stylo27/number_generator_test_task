Rails.application.routes.draw do
  resources :phones, only: :new
end
