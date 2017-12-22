Rails.application.routes.draw do
  resources :students, except: :show
  resources :courses
end
