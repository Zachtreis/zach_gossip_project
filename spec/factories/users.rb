FactoryBot.define do
    factory :user do
      first_name { "MyUserFirstName" }
      last_name { "MyUserLastName" }
      description { "MyUserDescription" }
      email { "MyUserEmail" }
      age { 1 }
      city { FactoryBot.create(:city) }
    end
  end