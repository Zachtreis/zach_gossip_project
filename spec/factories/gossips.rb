FactoryBot.define do
    factory :gossip do
      title { "MyGossipTitle" }
      content { "MyGossipContent" }
      user { FactoryBot.create(:user)}
    end
  end