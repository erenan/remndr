Rmndr::Application.routes.draw do
  devise_for :users
  root 'main#index'
  resources :links
  #resources :reminders #Currently not used in V1.0; base for reminder function in V2.0
  get 'categories/show_all' => 'categories#show_all'
  resources :categories
  post '/emails' => 'emails#create'
  get 'main/links' => 'main#links'
  get 'main/old_links' => 'main#old_links'
  get 'main/reminders' => 'main#reminders'
  get '/terms'    => 'high_voltage/pages#show', id: 'terms'
  get 'pages/main' => 'high_voltage/pages#show', id: 'main'
end
