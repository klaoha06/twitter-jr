class Conversation < ActiveRecord::Base
  validates_uniqueness_of :reply_id
  belongs_to :tweet
  belongs_to :reply, :class_name => "Tweet"
end
