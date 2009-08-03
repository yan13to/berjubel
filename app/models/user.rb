require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken

  has_many :items
  has_many :stores

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :message => "already been taken, please choose another name"
  validates_format_of :email, :with =>  Authentication.email_regex

  def self.authenticate(username, password)
    return nil if username.blank? || password.blank?
    u = find_by_username(username)
    u && u.authenticated?(password) ? u : nil
  end
end
