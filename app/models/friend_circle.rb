class FriendCircle < ActiveRecord::Base
  attr_accessible :owner_id, :name
  validates :owner_id, :name, presence: true

  has_many :friend_circle_memberships
  has_many :members, through: :friend_circle_memberships, source: :user
  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id
  )
end
