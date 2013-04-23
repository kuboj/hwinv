# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(100)      not null
#  email           :string(200)      not null
#  password_digest :string(200)      not null
#  remember_token  :string(200)      not null
#  admin           :boolean
#  created_at      :datetime         not null
#

class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password

  validates :name,     presence:   true,
                       length:     { maximum: 50 }
  validates :email,    presence:   true,
                       format:     { with: VALID_EMAIL_REGEX },
                       uniqueness: { case_sensitive: false }
  validates :password, presence:   true,
                       length:     { minimum: 6 }
  validates :password_confirmation, presence: true
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
