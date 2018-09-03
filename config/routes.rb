Rails.application.routes.draw do
  resource :session
  resources :stories do
    resources :votes do
    end
  end
end
