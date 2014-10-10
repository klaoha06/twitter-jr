class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :hashtagtweets
  has_many :hashtags, :through => :hashtagtweets
  has_many :mentiontweets
  has_many :mentions, :through => :mentiontweets
  validates_presence_of :text
  validates :text, length: { in: 1..140 }

  # has_many :replies, class_name: "Tweet", foreign_key: "tweet_id"
  # belongs_to :original, class_name: "Tweet"

  has_many :conversations
  has_many :replies, :through => :conversations
  has_many :inverse_conversations, :class_name => "Conversation", :foreign_key => "reply_id"
  has_many :inverse_replies, :through => :inverse_conversations, :source => :tweet

  has_many :retweetconversations
  has_many :retweets, :through => :retweetconversations
  has_many :inverse_retweetconversations, :class_name => "Retweetconversation", :foreign_key => "retweet_id"
  has_many :inverse_retweets, :through => :inverse_retweetconversations, :source => :tweet

  has_many :favoriteconversations
  has_many :favorites, :through => :favoriteconversations
  has_many :inverse_favoriteconversations, :class_name => "Favoriteconversation", :foreign_key => "favorite_id"
  has_many :inverse_favorites, :through => :inverse_favoriteconversations, :source => :tweet

  def generate_hashtags
    self.text.split(" ").select { |word| word[0] == '#'}
  end

  def generate_mentions
    self.text.split(" ").select { |word| word[0] == '@'}
  end

  after_create do
    hashtag_array = generate_hashtags
    hashtag_array.each { |hashtag|
      Hashtagtweet.create(hashtag_id: Hashtag.find_or_create_by(name: hashtag).id, tweet_id: id)}
  end

  after_create do
    mention_array = generate_mentions
    mention_array.each { |mention|
      Mentiontweet.create(mention_id: Mention.find_or_create_by(name: mention).id, tweet_id: id)}
  end
end
