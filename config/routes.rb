Rails.application.routes.draw do
  devise_for :users
  resources :students, except: :show
  resources :courses do
    resources :enrollments, only: %i[new create destroy]
    resources :tests, except: %i[index show]
  end
  resources :assistances, only: %i[create destroy update]

  root 'courses#index'
end
