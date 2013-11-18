class FriendCircle < ActiveRecord::Base
  attr_accessible :owner_id, :name
  validates :owner, :name, presence: true
  #validates :owner_id, :name, presence: true

  has_many :friend_circle_memberships, inverse_of: :friend_circle
  has_many :members, through: :friend_circle_memberships, source: :user
  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id,
    inverse_of: :owned_friend_circles
  )

  has_many :post_shares, inverse_of: :friend_circle

end
