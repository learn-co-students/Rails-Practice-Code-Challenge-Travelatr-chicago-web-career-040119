class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, uniqueness: true
  validates :bio, length: { minimum: 30}
  validates :age, numericality: { greater_than: 0 }



  def sum_likes_posts
    post_arr = self.posts.map do |post|
      post.likes
    end
    post_arr.reduce(:+)
  end

  def most_liked_post
    post_arr = self.posts.sort_by {|post| post.likes}
    post_arr.last
  end

  def all_posts
    self.posts
  end

  def most_posts
  end
 end
