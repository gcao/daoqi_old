class GameDataController < ApplicationController
  active_scaffold :game_data do |config|
    config.label = "Game Content"
    config.columns = [:format, :path, :is_commented, :commented_by, :description]
  end
end
