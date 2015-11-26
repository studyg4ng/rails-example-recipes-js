Rails.application.routes.draw do
  resources :ingredients
  resources :recipes do
    get 'search', :on => :collection
  end
 
  get 'about' => 'static_pages#about'
  root 'static_pages#home'
end
