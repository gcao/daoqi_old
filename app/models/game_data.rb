class GameData < ActiveRecord::Base
  set_table_name :game_data
  belongs_to :game
  file_column :path
end
