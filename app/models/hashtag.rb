class Hashtag < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :hashtagtweets
  has_many :tweets, :through => :hashtagtweets
end
