# frozen_string_literal: true

class User::Profile < ApplicationRecord
  belongs_to :user

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize: '180x180'
  end

  validates :avatar, blob: { content_type: :image, size_range: 1..5.megabytes }
  validates :first_name, :last_name, presence: true
end
