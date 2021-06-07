Rails.application.routes.draw do
 resources :posts
 get '/', to: 'users#index'
 resources :company
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
