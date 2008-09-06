class CreateTournamentResultTypes < ActiveRecord::Migration
  def self.up
    create_table :tournament_result_types do |t|
      t.string :name
      t.integer :value
      t.text :description
      t.string :updated_by
      t.timestamps
    end
  end

  def self.down
    drop_table :tournament_result_types
  end
end
