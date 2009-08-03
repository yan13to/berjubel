class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :pictures, :as => :object

  # validates_presence_of :user_id, :title, :description, :location, :category_id

  named_scope :all, :order => "updated_at DESC"

end
