class CreateTournamentGames < ActiveRecord::Migration
  def self.up
    create_table :tournament_games do |t|
      t.integer :tournament_id, :game_id
      t.integer :status # 0 - Not planned, 1 - Not started, 2 - Started, 3 - Finished
      t.string :result
      t.text :description
      t.integer :black_id, :white_id # link to tournament_players
      t.string :updated_by
      t.timestamps
    end
  end

  def self.down
    drop_table :tournament_games
  end
end
