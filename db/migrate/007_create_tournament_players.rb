class CreateTournamentPlayers < ActiveRecord::Migration
  def self.up
    create_table :tournament_players do |t|
      t.integer :tournament_id, :player_id, :result_id
      t.boolean :is_seed_player
      t.boolean :passed
      t.text :description
      t.string :updated_by
      t.timestamps
    end
  end

  def self.down
    drop_table :tournament_players
  end
end
