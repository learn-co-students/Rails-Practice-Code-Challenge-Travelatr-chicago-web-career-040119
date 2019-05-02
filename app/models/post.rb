class Post < ApplicationRecord
  belongs_to :blogger
  belongs_to :destination

  def posted_at
    self.created_at.to_s(:long_ordinal)[0..-7]
  end
end
