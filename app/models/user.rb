class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts

  private

  def recent_posts
    Post.order(created_at: :desc).limit(3)
  end
end


