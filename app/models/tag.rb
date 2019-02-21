class Tag < ApplicationRecord
    has_many :tags_by_gossips
    has_many :gossips, through: :tags_by_gossips
end
