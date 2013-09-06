class Article < ActiveRecord::Base
  validates_presence_of :title, :body
  belongs_to :user
  scope :sorted_descending, -> { order("created_at DESC") }
end
