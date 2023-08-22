Rails.application.routes.draw do
  root to: 'prompts#index'
  resources :prompts do
    collection { get :search }
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "prompts#index"
end
