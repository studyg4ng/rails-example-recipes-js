Rezepte::Application.routes.draw do
  match "/about" => "static_pages#about"
  resources :ingredients
  resources :recipes do
    get 'search', :on => :collection
  end
  root :to => "static_pages#home"
end
