class Favoriteconversation < ActiveRecord::Base
  validates_uniqueness_of :favorite_id
  belongs_to :tweet
  belongs_to :favorite, :class_name => "Tweet"
end
