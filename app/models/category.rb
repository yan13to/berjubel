class Category < ActiveRecord::Base
  has_many :items
  has_many :children, :class_name => "Category", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Category", :foreign_key => "parent_id"

  named_scope :all_parents, :conditions => {:parent_id => nil}

  def has_children?
    self.children.size > 0
  end
end
