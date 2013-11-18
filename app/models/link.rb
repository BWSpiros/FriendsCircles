class Link < ActiveRecord::Base
  attr_accessible :post_id, :text

  validates :post, :text, presence: true

  belongs_to :post, inverse_of: :links
end
