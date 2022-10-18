Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get 'ranking/index'

  # API
  post '/add_weapon' => 'api#add_all_weapons'
  post '/submit_purchases' => 'api#submit_purchases'
end
