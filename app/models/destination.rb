class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def most_recent_posts(num)
    self.posts.order(created_at: :desc).limit(num).to_a
  end

  def most_liked_posts(num)
    self.posts.order(likes: :desc).limit(num).to_a
  end
end
