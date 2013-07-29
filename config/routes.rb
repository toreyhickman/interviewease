PairingRoulette::Application.routes.draw do
 
  root to: "sessions#new"
  resources :interviews
  resources :companies
  resources :employees
  resources :challenges
  resources :topics
  resources :candidates
  match '/interviews/:identifier', to: 'interviews#show'
  match '/api/update_code', to: 'api#update_code'
  match '/api/run_code', to: 'api#run_code'
  match '/login', to: 'employees#login'
  match '/signup', to: 'companies#signup'
end
