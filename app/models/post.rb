class Post < ApplicationRecord
  belongs_to :destination
  belongs_to :blogger

  validates :title, presence: true
  validates :blogger_id, presence: true
  validates :likes, presence: true
  validates :destination_id, presence: true
  validates :content, length: { minimum: 101 }, presence: true


  def like_post
    self.likes += 1
  end

end
