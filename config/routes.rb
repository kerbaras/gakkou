Rails.application.routes.draw do
  resources :tests
  resources :students, except: :show
  resources :courses do
    resources :enrollments, only: %i[new create destroy]
  end
end
