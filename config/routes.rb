Rails.application.routes.draw do
  resources :ingredients
  resources :recipes do
    get 'search', on: :collection
  end

  get 'playground' => 'static_pages#playground'
  get 'about'      => 'static_pages#about'
  get 'todo'       => 'static_pages#todo'
  root 'static_pages#home'
end
