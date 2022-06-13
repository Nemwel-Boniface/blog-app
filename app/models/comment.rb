class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  private

  def update_comments_counter
    user.increment(:comments_counter)
  end
end
