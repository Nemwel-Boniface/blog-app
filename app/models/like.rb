class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  private

  def update_likes_counter
    post.increment(:likes_counter)
  end

end