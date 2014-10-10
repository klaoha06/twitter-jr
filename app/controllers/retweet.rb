get '/retweets/:id' do
  original = Tweet.find(params[:id])
  original.retweets << Tweet.create(original_id: params[:id], text: "RT @#{User.find(original.user_id).username} #{original.text}", user_id: session[:user_id])
  redirect back
end
