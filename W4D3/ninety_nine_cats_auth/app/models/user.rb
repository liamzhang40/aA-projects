# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  attr_reader :password

  after_initialize :ensure_session_token

  has_many :cats,
    class_name: 'Cat',
    foreign_key: :user_id,
    primary_key: :id

  has_many :cat_rental_requests

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_sesssion_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    pass = BCrypt::Password.new(self.password_digest)
    pass.is_password?(password)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by(username: user_name)
    return user if user && user.is_password?(password)
    nil
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end


end
