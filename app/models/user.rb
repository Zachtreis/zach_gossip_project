class User < ApplicationRecord
	belongs_to :city
	has_many :comments
	has_many :gossips
	has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  	has_many :received_messages, foreign_key: 'receiver_id', class_name: "MultiPrivateMessage"
	has_many :multi_private_messages
	has_many :private_messages, through: :multi_private_messages
	end
