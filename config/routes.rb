Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cards
      resources :products
      resources :new_products
      resources :triggers
    end
  end

  match '/api/v1/cards/:id', :controller => 'option_configs', :action => 'options', :via => :options

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
