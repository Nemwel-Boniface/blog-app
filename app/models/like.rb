class Like < ApplicationRecord
  belongs_to :user, counter_cache: :likes_count
  belongs_to :post 
  after_save :update_likes_counter

  private

  def update_likes_counter
    post.update(likes_counter: post.likes.size)
  end
end
