require 'faker'
require 'date'

User.create!(:username => 'daniel', :password => 'password')
User.create!(:username => 'john', :password => 'password')

10.times do
  User.create!(:username => Faker::Internet.user_name, :password => Faker::Internet.password)
end

User.create!(:username => 'korn', :password => 'password')

30.times do
  @@length = User.all.length
  array = (1..@@length).to_a
  user1 = array.sample
  array.delete(user1)
  user2 = array.sample
  Relationship.create!(:user_id => user1, :follower_id => user2)
end

50.times do
  Tweet.create!(:text => Faker::Company.catch_phrase.split(" ").each_with_index.map { |word,index| index.even? ? word = "##{word}" : word}.join(" "), :user_id => rand(1..@@length), :created_at => Date.today - rand(10))
end

Tweet.create!(:text => "#hello @john @korn @daniel #end", :user_id => 1)