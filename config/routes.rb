Rails.application.routes.draw do
  get 'welcome/:name', to: 'welcome#name'
  root 'gossips#index'
  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'
  resources :gossips
  resources :authors

  # get ''
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
