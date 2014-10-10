post '/tweets/new' do
  tweet = Tweet.create(text: params[:text], user_id: session[:user_id])
  redirect "/#{User.find(tweet.user_id).username}"
end