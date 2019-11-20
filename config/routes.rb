Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'login', to: 'sessions#create'
      root 'address#index'
    end
  end
end
