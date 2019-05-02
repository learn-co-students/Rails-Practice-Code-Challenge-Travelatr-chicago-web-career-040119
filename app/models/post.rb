class Post < ApplicationRecord
  belongs_to :destination
  belongs_to :blogger

  validates :title, presence: true
  validates :content, length: {minimum: 100}


  def find_blogger_name
    self.blogger.name
  end

  def most_recent_dest_posts
    post_arr =self.destination.sort_by {|post| post.created_at}
    post_arr.last(5)
  end
end
