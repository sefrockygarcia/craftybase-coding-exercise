Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :students, only: [] do
        resources :homeworks, only: [:index, :create], module: :students
      end
      resources :teachers, only: [] do
        resources :student_homeworks, only: [:index, :update], module: :teachers
      end
    end
  end
end
