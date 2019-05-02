class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  validates :name, presence: true, uniqueness: true
  validates :country, presence: true, uniqueness: true

def most_recent_five
  sorted_posts = self.posts.sort_by {|post| post.created_at }
  reverse_sort = sorted_posts.reverse
  reverse_sort.count > 5 ? reverse_sort.slice(0,5) : reverse_sort
end

def most_likes
  sorted_posts = self.posts.sort_by {|post| post.likes}
  sorted_posts.last
end

end
