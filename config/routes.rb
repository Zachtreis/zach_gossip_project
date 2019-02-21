Rails.application.routes.draw do
  get 'welcome/:name', to: 'welcome#name', as: 'welcome'
  root 'gossips#index'
  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'
  resources :gossips
  resources :authors

  resources :gossips do
    resources :comments
    resources :likes, only: [:new, :create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
