Rails.application.routes.draw do
  root 'stories#index'
  resource :session
  resources :users
  resources :stories do
    collection do
      get 'bin'
    end
    resources :votes do
    end
  end
end
