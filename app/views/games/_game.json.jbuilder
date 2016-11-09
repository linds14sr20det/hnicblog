json.extract! game, :id, :attacker, :defender, :winner, :location, :created_at, :updated_at
json.url game_url(game, format: :json)