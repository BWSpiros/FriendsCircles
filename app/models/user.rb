class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :session_token, :password

  before_validation :ensure_session_token

  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true
  # validates :password, length: { minimum: 6, allow_nil: true }

  def password=(pass)
    self.password_digest = BCrypt::Password.create(pass)
  end

  def self.find_by_credentials(email, pass)
    user = User.find_by_email(email)
    return nil if user.nil?
    user.is_password?(pass) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end