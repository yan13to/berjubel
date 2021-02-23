# frozen_string_literal: true

class User::Profile < ApplicationRecord
  belongs_to :user
end
