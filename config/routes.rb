Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root 'address#index'
    end
  end
end
