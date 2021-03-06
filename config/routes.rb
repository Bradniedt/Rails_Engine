Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :customers do
        get '/find', to: "find#show"
        get '/:id/favorite_merchant', to: "favorite#show"
        get '/:id/invoices', to: "invoices#index"
        get '/:id/transactions', to: "transactions#index"
      end
      namespace :merchants do
        get '/find', to: "find#show"
        get '/most_revenue', to: "revenue#index"
        get '/most_items', to: "sold#index"
        get '/revenue', to: "revenue#index"
        get '/:id/items', to: "items#index"
        get '/:id/invoices', to: "invoices#index"
      end
      namespace :invoices do
        get '/find', to: "find#show"
        get '/:id/transactions', to: "transactions#index"
        get '/:id/invoice_items', to: "invoice_items#index"
        get '/:id/items', to: "items#index"
        get '/:id/customer', to: "customers#show"
        get '/:id/merchant', to: "merchants#show"
      end
      namespace :items do
        get '/find', to: "find#show"
        get '/most_revenue', to: "revenue#index"
        get '/most_items', to: "sold#index"
        get '/:id/invoice_items', to: "invoice_items#index"
        get '/:id/merchant', to: "merchants#show"
      end
      namespace :invoice_items do
        get '/find', to: "find#show"
        get '/:id/invoice', to: "invoices#show"
        get '/:id/item', to: "items#show"
      end
      namespace :transactions do
        get '/find', to: "find#show"
        get '/:id/invoice', to: "invoices#show"
      end
      resources :customers, only: [:index, :show]
      resources :merchants, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      get '/merchants/:id/revenue', to: "revenue#show"
      get '/merchants/:id/favorite_customer', to: "favorite#show"
      get '/items/:id/best_day', to: "best#show"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
