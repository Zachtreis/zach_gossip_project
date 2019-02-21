class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :likes
  has_many :subcomments, class_name: "Comment", foreign_key: "comment_id"
  validates :content, presence: true
end
