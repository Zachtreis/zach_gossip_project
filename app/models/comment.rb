class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  belongs_to :gossip
  has_many :likes
  has_many :subcomments, class_name: "Comment", foreign_key: "comment_id"
  validates :content, presence: true
  # validates :commentable_type, allow_blank: true
  # validates :commentable_id, allow_blank: true
end