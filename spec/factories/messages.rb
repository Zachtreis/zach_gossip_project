FactoryBot.define do
  factory :message do
    content { "MyText" }
    conversation { nil }
    user { nil }
    read { false }
  end
end
