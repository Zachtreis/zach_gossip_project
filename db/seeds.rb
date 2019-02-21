# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
#création avec différents modules de faker des éléments de mes tables
#remise a zero des tables
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
TagsByGossip.destroy_all
PrivateMessage.destroy_all
MultiPrivateMessage.destroy_all
User.destroy_all
Comment.destroy_all
Like.destroy_all

#Create City
5.times do
  city = City.create!(name: Faker::Nation.capital_city, zip_code: Faker::Address.zip_code)
end

#Create Tags
5.times do
  tag = Tag.create!(title: Faker::Dessert.variety)
end

#Create User
10.times do
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name , description: Faker::TvShows::HowIMetYourMother.quote, email: Faker::Internet.email, age: Faker::Number.between(18, 75), city_id: City.all.ids.sample)
end

#Create Gossip
#checke au moins un tag par gossip
10.times do
  gossip = Gossip.create!(title: Faker::Books::Lovecraft.sentence(3, 1), content: Faker::ChuckNorris.fact, user_id: User.all.ids.sample)
end

#Create tags by potin
30.times do
  tags_by_gossip = TagsByGossip.create!(gossip_id: Gossip.all.ids.sample, tag_id: Tag.all.ids.sample)
end

#Create Private Message
10.times do
  privatemessage = PrivateMessage.create!(content: Faker::GreekPhilosophers.quote, sender_id: User.all.ids.sample)
end

#create join table
10.times do
  multi_pm = MultiPrivateMessage.create!(recipient_id: User.all.ids.sample, private_message_id: PrivateMessage.all.ids.sample)
end

#create comments
i = 0
20.times do
  # comment = Comment.create!(content: Faker::Simpsons.quote , user_id: User.all.ids.sample, gossip_id: Gossip.all.ids.sample)
  if i % 2 == 0
    comment = Comment.create!(content: Faker::TvShows::Simpsons.quote, user_id: User.all.ids.sample,commentable_type: Gossip.name, commentable_id: Gossip.all.ids.sample)
  else
    comment = Comment.create!(content: Faker::TvShows::Simpsons.quote, user_id: User.all.ids.sample, commentable_type: Gossip.name, commentable_id: Gossip.all.ids.sample)
  end
  i+=1
end

#create likes
#de façon aléatoire va rajouter 1 like à 1 comment ou à 1 like
i = 0
20.times do
  if i % rand(2..3) == 0
    like = Like.create!(comment_id: Comment.all.ids.sample)
  else
    like = Like.create!(gossip_id: Gossip.all.ids.sample) #comment_id: Comment.ids.first(2).sample) 
  end
  i += 1
end
