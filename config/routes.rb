Rails.application.routes.draw do
  root                 'static_pages#home'
  get    'sobre'    => 'static_pages#about'
  get    'cadastro' => 'users#new'
  get    'indice'   => 'users#index'
  get    'entrar'   => 'sessions#new'
  post   'entrar'   => 'sessions#create'
  delete 'sair'     => 'sessions#destroy'

  resources :users
  resources :groups
  resources :participants
end
