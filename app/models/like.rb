class Like < ApplicationRecord
  belongs_to :comment, optional: true
  belongs_to :gossip, optional: true
end
