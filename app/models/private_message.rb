class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: "User"
  has_many :multi_private_messages
  has_many :users, through: :multi_private_messages
  has_many :recipients, through: :multi_private_messages
end
