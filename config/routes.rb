Rezepte::Application.routes.draw do
  match "/about" => "static_pages#about"
  resources :ingredients
  resources :recipes
  root :to => "static_pages#home"
end
