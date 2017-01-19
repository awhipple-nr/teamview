Rails.application.routes.draw do

  get '/about', to: 'welcome#about'
  root to: 'welcome#index'
  resources :teams

  namespace :api, defaults: { format: :json } do
    resources :teams
   end
end
