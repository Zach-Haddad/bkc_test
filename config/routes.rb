Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }

  resources :posts do
    resources :comments
  end

  root to: "posts#index"
end
