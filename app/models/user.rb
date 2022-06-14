class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy

  private

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
