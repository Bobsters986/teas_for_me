Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :customers, only: [] do
        resources :subscriptions, only: %i[index create update], module: 'customers'
        # get '/subscriptions', to: 'customers/subscriptions#index'
        # post '/subscriptions', to: 'customers/subscriptions#create'
        # patch '/subscriptions/:id', to: 'customers/subscriptions#update'
      end
    end
  end
end
