class PasswordReset < ActiveRecord::Base
  attr_accessible :user_id, :reset_token
  validates :user_id, :reset_token, presence: true

  belongs_to :user
end
