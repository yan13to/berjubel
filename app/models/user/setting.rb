# frozen_string_literal: true

class User::Setting < ApplicationRecord
  enum listing_mode: %i[column list]

  belongs_to :user
end
