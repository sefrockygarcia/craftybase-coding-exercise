Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :students, only: [] do
        resources :homeworks, only: [:index, :create], module: :students
      end
    end
  end
end
