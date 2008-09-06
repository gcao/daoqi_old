class CreateGameData < ActiveRecord::Migration
  def self.up
    create_table :game_data do |t|
      t.integer :game_id
      t.integer :format # 1 - sgf
      t.string :charset
      t.integer :option # 1 - from data field, 2 - file system(path), 3 - internet(url in path field)
      t.text :data
      t.string :path
      t.string :url
      t.boolean :is_commented
      t.string :commented_by
      t.text :description
      t.string :updated_by
      t.timestamps
    end
  end

  def self.down
    drop_table :game_data
  end
end
