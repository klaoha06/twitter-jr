class Reply < Tweet
  belongs_to :user
  belongs_to :tweet
end