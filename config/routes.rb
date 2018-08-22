Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  authenticated do
    root 'recipients#index'
    resources :recipients, only: [:new, :create, :index] do
      resources :payments, only: [:new, :create]
    end
     devise_scope :user do
       delete 'sessions', to: 'devise/sessions#destroy', as: :destroy_user_session
     end
  end
  unauthenticated do
    devise_scope :user do
      root 'homes#index'

    end
  end
end
