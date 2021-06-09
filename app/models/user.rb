# frozen_string_literal: true

# User model
class User < ApplicationRecord
  attr_accessor :from_api

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  has_one :profile, class_name: 'User::Profile', dependent: :destroy
  has_one :setting, class_name: 'User::Setting', dependent: :destroy

  has_many :item_labels, class_name: 'ItemLabel'
  has_many :labels, through: :item_labels
  has_many :stores, dependent: :destroy

  def my_store?(store)
    stores.include?(store)
  end
end
