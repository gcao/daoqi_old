class NationArea < ActiveRecord::Base
  has_many :players
  validates_uniqueness_of :name
end
