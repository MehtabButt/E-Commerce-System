Rails.application.routes.draw do
  # authenticated_user, ->(user) {user.user_type === 'admin'} do 
    
  # end
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root 'home#index'
  resources :home, only: [:index]
  resources :categories, format: :json, shallow: true, only: [:index, :create, :destroy] do 
    resources :products, format: :json, shallow: true, only: [:index, :show] do 
      resources :comments, format: :json, only: [:create, :index]
    end
  end
  get '/orders_checkout', to:'orders#checkout', format: :json
  get '/total_order_products', to:'order_products#total_products', format: :json
  resources :orders, format: :json, shallow: true, only: [:index, :create] do 
    resources :order_products, format: :json, only: [:destroy]
  end
  get '*path', to:'home#index' 
end
