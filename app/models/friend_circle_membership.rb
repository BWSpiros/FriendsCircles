class FriendCircleMembership < ActiveRecord::Base
  attr_accessible :friend_circle_id, :user_id
  validates :user, :friend_circle, presence: true
  # validates :friend_circle_id, :user_id, presence: true

  belongs_to :friend_circle, inverse_of: :friend_circle_memberships
  belongs_to :user, inverse_of: :friend_circle_memberships
end
