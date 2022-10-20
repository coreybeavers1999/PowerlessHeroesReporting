Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get 'ranking/index'

  # API
  post '/add_weapon' => 'api#add_all_weapons'
  post '/submit_purchases' => 'api#submit_purchases'
  post '/open_game_session' => 'api#open_game_session'
  post '/close_game_session' => 'api#close_game_session'
end
