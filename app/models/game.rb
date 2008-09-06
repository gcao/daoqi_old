class Game < ActiveRecord::Base
  has_one :primary_game_data, :class_name=>"GameData"
  has_many :game_data, :class_name=>"GameData"
  belongs_to :black_player, :class_name=>"Player", :foreign_key=>"black_id", 
    :conditions=>"is_online_game=0"
  belongs_to :white_player, :class_name=>"Player", :foreign_key=>"white_id",
    :conditions=>"is_online_game=0"

  def players
    []
  end
end
