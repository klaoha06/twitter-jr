require 'faker'

10.times do
  User.create!(:username => Faker::Internet.user_name, :password_hash => Faker::Internet.password)
end

50.times do
  Tweet.create!(:text => Faker::Company.catch_phrase, :user_id => rand(1..10))
end

30.times do
  length = User.all.length
  array = (1..length).to_a
  user1 = array.sample
  array.delete(user1)
  user2 = array.sample
  Relationship.create!(:user_id => user1, :follower_id => user2)
end