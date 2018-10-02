Rails.application.routes.draw do
  root 'stories#index'
  resource :session
  resources :stories do
    resources :votes do
    end
  end
end
