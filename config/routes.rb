Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'

  root 'items#index'
  
  match '/about-us', to: 'static_pages#about_us', via: 'get'
  match '/career', to: 'static_pages#career', via: 'get'
  match '/contacts', to: 'static_pages#contacts', via: 'get'
  match '/drug-store', to: 'static_pages#drug_store', via: 'get'
  match '/help', to: 'static_pages#help', via: 'get'
  match '/refund-policy', to: 'static_pages#refund_policy', via: 'get'
  match '/shipping', to: 'static_pages#shipping', via: 'get'

  resources :items do
    collection do
      match 'search' => 'items#index', :via => [:get, :post], :as => :search
    end
  end

  resources  :orders

  devise_for :users, controllers: {
   registrations: "registrations",
   sessions:      "sessions" }

  resources  :items do
    put :to_cart, on: :member
  end

  resources :cart do
    put :make_an_order
    put :update
  end
  
  resources :positions
  post "cart/:id/edit"    => "cart#edit"

  resources :catalogs, only: :show do
    resources :categories, only: :show, path: ''
      resources :items, only: :show, path: ''
  end

end
