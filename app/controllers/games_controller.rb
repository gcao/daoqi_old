class GamesController < ApplicationController
  active_scaffold :game do |config|
    config.columns = [:type, :name, :event, :place, :source, :played_at,
      :rule, :komi, :result, :winner, :moves, 
      :is_online_game, :platform_id, :black_id, :black_name, :black_rank, 
      :white_id, :white_name, :white_rank, :primary_game_data, :description, :game_data]
    config.list.columns = [:type, :event, :name, :played_at, 
      :black_name, :black_rank, :white_name, :white_rank, :rule, :komi, :result, :winner, :moves]
    config.nested.add_link "Content".t, [:game_data]
  end
end
