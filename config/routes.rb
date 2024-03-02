Rails.application.routes.draw do
  resources :candidaturas
  resources :empregadors
  resources :candidatos
  resources :vagas
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "candidaturas#home"
end
