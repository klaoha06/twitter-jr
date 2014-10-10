get '/hashtags/:hashtag_name' do
  @title = params[:hashtag_name]
  @tweets = Hashtag.find_by(name: "##{params[:hashtag_name]}").tweets
  @tweets = @tweets.sort_by(&:created_at).reverse
  erb :display_hashtag
end