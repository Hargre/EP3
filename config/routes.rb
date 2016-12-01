Rails.application.routes.draw do
  root              'static_pages#home'
  get 'sobre'    => 'static_pages#about'
  get 'cadastro' => 'users#new'

  resources :users
end
