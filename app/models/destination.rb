class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts


  def recent_posts
    post_arr =self.posts.sort_by {|post| post.created_at}
    post_arr.last(5)
  end

  def most_liked_post
    post_arr = self.posts.sort_by {|post| post.likes}
    post_arr.last
  end

  def average_age
    avg_arr = self.bloggers.map do |blogger|
      blogger.age
    end
    if self.bloggers.count >0
     avg_arr.reduce(:+)/self.bloggers.count
   end
  end

end
