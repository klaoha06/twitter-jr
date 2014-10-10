post '/tweets/new' do
  tweet = Tweet.create(text: params[:text], user_id: session[:user_id])
  redirect "/#{User.find(tweet.user_id).username}"
end

get '/tweets/:id' do
  @tweets = [] << Tweet.find(params[:id].to_i)
  @participants = "#{@tweets.first.user.username} "
  @tweets.first.mentions.each {|mention| @participants << "#{mention.name} " }
  if @tweets.first.replies.length > 0
    @replies = @tweets.first.replies
    erb :conversation
  else
    erb :display_single_tweet
  end
end