class Category < ApplicationRecord
  has_many :children, class_name: 'Category', foreign_key: :parent_id
  belongs_to :parent, class_name: 'Category', foreign_key: :parent_id, optional: true

  has_one_attached :image

  validates :name, presence: true

  scope :parents, -> { where(parent_id: nil) }

  def has_children?
    self.children.size > 0
  end

  def has_parent?
    !self.parent.nil?
  end
end
