Rails.application.routes.draw do
  root 'home#index', as: 'home_page'
  resources :users, only: %i[new create]
  get '/:token/confirm_account/', to: 'users#confirm_account', as: 'confirm_account'
  get '/:token/edit/', to: 'password_resets#edit', as: 'password_reset'
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  resources :password_resets, only: %i[new create update]
  namespace :admin do
    resources :deals do
      member do
        put 'publish'
        put 'unpublish'
      end
    end
    resources :locations
    resources :collections do
      member do
        put 'publish'
        put 'unpublish'
      end
    end
  end
  resources :deals, only: %i[show]
  get '/cart', to: 'orders#cart', as: 'cart'
  put '/update', to: 'orders#update', as: 'update_order'

  get '/checkout', to: 'orders#checkout', as: 'checkout'
  get '/order_address', to: 'orders#address', as: 'order_address'
  get '/confirmation', to: 'orders#confirmation', as: 'confirmation'
  patch '/confirm_order', to: 'orders#confirm', as: 'confirm_order'
  patch '/update_email', to: 'orders#update_email'
  patch '/update_address', to: 'orders#update_address'
end
