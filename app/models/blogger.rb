class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, uniqueness: true, presence: true
  validates :age, numericality: { greater_than: 0 }, presence: true
  validates :bio, length: { minimum: 31 }, presence: true

  def total_likes
    self.posts.map { |post| post.likes }.reduce(:+)
  end

  def most_likes
    sorted_posts = self.posts.sort_by {|post| post.likes}
    sorted_posts.last
  end

end
