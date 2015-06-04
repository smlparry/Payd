Rails.application.routes.draw do
  root to: 'pages#home'

  namespace :dash do
    get '/', to: redirect('/dash/home')
    get 'home'
    resources 'plans', 'subscribers', 'transactions'
    namespace :account do
      get '/' => 'account#index'
      get '/stripe/connect' => 'stripe#new'
      get '/stripe/disconnect'
      resources :stripe
    end
  end

  # Payment page controller
  get 'p/:id' => 'payment_page#show'

  devise_for :users

  get 'pages/home'
  get 'pages/dash'
end
