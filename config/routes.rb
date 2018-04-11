Rails.application.routes.draw do
  resources :vehicles
  devise_for :users
  root 'welcome#index'
  post 'contact' => 'agreements#contact'
  get 'myagreements' => 'agreements#list_agreements'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
