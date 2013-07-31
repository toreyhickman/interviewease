PairingRoulette::Application.routes.draw do
 
  root to: "sessions#new"

  resources :interviews
  resources :companies
  resources :employees
  resources :challenges
  resources :topics
  resources :candidates
  resources :sessions
  resources :checkins
  resources :given_challenges
  
  match '/interviews/:identifier', to: 'interviews#show'
  match '/api/update_code', to: 'api#update_code'
  match '/api/update_challenge', to: 'api#update_challenge'
  match '/api/run_code', to: 'api#run_code'
  match '/login', to: 'sessions#create'
  match '/logout', to: 'sessions#destroy', via: [:delete]
  match '/signup', to: 'companies#signup'
  match '/interview/mark_complete', to: 'interviews#mark_complete'
end
