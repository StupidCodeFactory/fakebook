Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  authenticated do
    root 'recipients#index'
    resources :recipients, only: [:new, :create, :index] do
      resources :payments, only: [:new, :create]
    end
  end
  unauthenticated do
    devise_scope :user do
      root 'homes#index'

    end
  end
end
