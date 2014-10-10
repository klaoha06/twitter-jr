class Mentiontweet < ActiveRecord::Base
  belongs_to :mention
  belongs_to :tweet
end