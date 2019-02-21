class Gossip < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :tags_by_gossips
  has_many :tags, through: :tags_by_gossips
  has_many :comments, as: :commentable
  validates :title, presence: true, length: { minimum: 3, maximum: 14 }
  validates :content, presence: true
end
