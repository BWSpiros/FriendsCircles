class Post < ActiveRecord::Base
  attr_accessible :author_id, :body
  validates :author, :body, presence: true

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id,
    inverse_of: :posts
  )

  has_many :post_shares, inverse_of: :post

  has_many :links, inverse_of: :post

end
