class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :hashtagtweets
  has_many :hashtags, :through => :hashtagtweets
  has_many :mentiontweets
  has_many :mentions, :through => :mentiontweets
  validates_presence_of :text
  validates :text, length: { in: 1..140 }

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
