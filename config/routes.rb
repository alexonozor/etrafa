Rails.application.routes.draw do
  resources :posting_sources
  root 'home#index'

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'register', to: 'users#new', as: 'register'
 

  

  resources :products do
    member do
      get 'send_inquiry'
    end
    collection do
      post 'post_inquiry'
    end
  end

  resources :sessions

  resources :users do

    member do
      get 'buyer_profile' 
      get 'request_qoutation' 
      get 'manage_received_quotations'
      get 'manage_sent_quotations'
    end

    collection do 
      get 'account'
    end
  end
  resources :companies

  get 'suppliyer_panel', to: 'users#suppliyer_panel', as: 'suppliyer_panel'
  get 'suppliyer_panel/new', to: 'products#new', as: 'new_suppliyer_panel_products'
  get 'suppliyer_panel/saved_products', to: 'products#saved_products', as: 'suppliyer_panel_saved_products'
  get 'suppliyer_panel/submitted_products', to: 'products#submitted_products', as: 'suppliyer_panel_submitted_products'
  get 'suppliyer_panel/products', to: 'products#suppliyer_panel_products', as: 'suppliyer_panel_products'
  get 'suppliyer_panel/product/:id', to: 'products#suppliyer_panel_product', as: 'suppliyer_panel_product'
  get 'suppliyer_panel/categories', to: 'categories#suppliyer_panel_categories', as: 'suppliyer_panel_categories'

  get 'suppliyer_panel/company', to: 'companies#suppliyer_panel_company', as: 'suppliyer_panel_company'
  get 'suppliyer_panel/company/:id/edit', to: 'companies#edit', as: 'suppliyer_panel_company_edit'
  put 'suppliyer_panel/company/:id', to: 'companies#update', as: 'suppliyer_panel_company_update'
   
  

  resources :categories
  get '/:parent_category/:child_category', to: 'categories#category_products', as: 'category_products'
  get '/:id', to: 'categories#select_category_children', as: 'select_category_children'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
