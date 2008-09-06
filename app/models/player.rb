class Player < ActiveRecord::Base
  belongs_to :nation_area
  validates_presence_of :last_name, :first_name
  has_many :games, :class_name=>"Game", :finder_sql=>
    'select distinct * from games where is_online_game=0 and (black_id=#{id} or white_id=#{id})'
end
