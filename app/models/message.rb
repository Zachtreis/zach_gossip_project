class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates :content, presence: true

  def message_time
    created_at.strftime("le %m/%d/%y à %l:%M %p")
  end
end
