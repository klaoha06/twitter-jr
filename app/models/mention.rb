class Mention < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :mentiontweets
  has_many :tweets, :through => :mentiontweets
end
