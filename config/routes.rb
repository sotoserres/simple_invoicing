Rails.application.routes.draw do
  resources :payments
  resources :machineries
  resources :tractors
  resources :items
  resources :customers
  resources :invoices
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    registrations: :registrations, sessions: :sessions, confirmations: 'confirmations'
                                  },
                     path: 'user'

  resource :user do
    resources :openids
  end

  # Admin
  namespace :admin do
    resources :users do
      member do
        patch :confirm
      end
    end
  end
  #-- End of Admin

  get 'contact' => 'home#contact'
  post 'contact' => 'home#contact'
  get 'recommend' => 'home#recommend'
  post 'recommend' => 'home#recommend'

  root to: 'home#index', via: [:get]

  match "/404", :to => "errors#error", via: :all
  match "/500", :to => "errors#error", via: :all
end
