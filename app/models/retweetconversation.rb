class Retweetconversation < ActiveRecord::Base
  validates_uniqueness_of :retweet_id
  belongs_to :tweet
  belongs_to :retweet, :class_name => "Tweet"
end
