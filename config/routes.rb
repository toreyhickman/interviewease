PairingRoulette::Application.routes.draw do
 
  root to: "interviews#show"
  resources :interviews

  match '/api/update_code', to: 'api#update_code'
  match '/api/run_code', to: 'api#run_code'

end
