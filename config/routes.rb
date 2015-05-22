Rails.application.routes.draw do

  root to: 'pages#home'

  namespace :dash do
    get '/', to: redirect('/dash/home')
    get 'home'
    resources 'plans', 'subscribers', 'transactions'
    namespace :account do
      get '/' => 'account#index'
      resources 'stripe'
    end
  end

  devise_for :users

  get 'pages/home'
  get 'pages/dash'

end
