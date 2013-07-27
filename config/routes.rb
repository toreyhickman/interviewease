PairingRoulette::Application.routes.draw do
 
  root to: "interviews#show"
  resources :interviews

  match '/api/update_code', to: 'api#update_code'

end
