Rails.application.routes.draw do
  resources :students, except: :show
  resources :courses do
    resources :enrollments, only: %i[new create destroy]
  end

  root 'courses#index'
end
