class Picture < ActiveRecord::Base
  belongs_to :object, :polymorphic => true
  has_many :assets, :as => :object

  def picture=(picture)
    
  end

end
