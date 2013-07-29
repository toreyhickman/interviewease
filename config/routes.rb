PairingRoulette::Application.routes.draw do
 
  root to: "sessions#new"
  resources :interviews

  match '/api/update_code', to: 'api#update_code'
  match '/api/run_code', to: 'api#run_code'
  match '/login', to: 'employees#login'

end
