Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about' => 'homes#about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'searchs/search' => 'searchs#search'

  resources :users
  
  #resources :users do
  #	get :search, on: :collection
  #end

  resources :books

end
