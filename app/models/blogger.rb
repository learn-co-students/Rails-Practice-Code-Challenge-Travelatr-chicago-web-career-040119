class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }
  validates :bio, length: { minimum: 30 }

  def most_liked_posts(num)
    self.posts.order(likes: :desc).limit(num).to_a
  end

  # def top_reviewed_destinations(num)
  #   self.posts.order(destinations: :desc).limit(num)
  # end


end
