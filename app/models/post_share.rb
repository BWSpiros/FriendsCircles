class PostShare < ActiveRecord::Base
  attr_accessible :friend_circle_id, :post_id

  belongs_to :post, inverse_of: :post_shares
  belongs_to :friend_circle, inverse_of: :post_shares

end
