class Gossip < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :tags_by_gossips
  has_many :tags, through: :tags_by_gossips
  has_many :comments, as: :commentable
end
