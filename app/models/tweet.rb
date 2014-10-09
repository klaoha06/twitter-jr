class Tweet < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :text
  validates :text, length: { in: 1..140 }
end
