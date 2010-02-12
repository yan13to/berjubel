class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :pictures, :as => :object

  # validates_presence_of :user_id, :title, :description, :location, :category_id

  class Type
    DRAFT = 1
    
  end

end
