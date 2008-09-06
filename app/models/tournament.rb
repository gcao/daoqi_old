class Tournament < ActiveRecord::Base
  acts_as_nested_set
  has_many :children, :foreign_key => :parent_id, :class_name => 'Tournament'
  belongs_to :parent, :foreign_key => :parent_id, :class_name => 'Tournament'

  def text
    name
  end
  
  def self.root_nodes
    find(:all, :conditions => 'parent_id IS NULL')
  end

  def self.find_children(start_id = nil)
    start_id.to_i == 0 ? root_nodes : find(start_id).direct_children
  end
  
  def leaf
    unknown? || children_count == 0
  end

  def to_json_with_leaf(options = {})
    self.to_json_without_leaf(options.merge(:methods => [:leaf, :text]))
  end

  alias_method_chain :to_json, :leaf
end
