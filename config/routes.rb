PairingRoulette::Application.routes.draw do
 
  root to: "interviews#show"
  resources :interviews

end
