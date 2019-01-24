Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index]
      resources :merchants, only: [:index]
      resources :invoices, only: [:index]
      resources :items, only: [:index]
      resources :invoice_items, only: [:index]
      resources :transactions, only: [:index]
      get '/merchants/:id/revenue', to: "revenue#index"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
