Rails.application.routes.draw do
  resources :students, except: :show
  resources :courses do
    resources :enrollments, only: %i[new create destroy]
    resources :tests, except: %i[index show]
    resources :assistances, only: %i[create destroy update]
  end

  root 'courses#index'
end
