Rails.application.routes.draw do
  root 'home#index'

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'register', to: 'users#new', as: 'register'
 

  resources :users do
    resources :companies
  end

  resources :products do
    member do
      get 'send_inquiry'
    end
    collection do
      post 'post_inquiry'
    end
  end
  resources :sessions
  resources :users
  resources :categories
  get '/:parent_category/:child_category', to: 'categories#category_products', as: 'category_products'
  get '/:id', to: 'categories#select_category_children', as: 'select_category_children'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
