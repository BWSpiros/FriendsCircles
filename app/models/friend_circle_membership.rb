class FriendCircleMembership < ActiveRecord::Base
  attr_accessible :friend_circle_id, :user_id

  validates :friend_circle_id, :user_id, presence: true

  belongs_to :friend_circle
  belongs_to :user
end
