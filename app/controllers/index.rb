# Index
get '/' do
  if session[:user_id] == nil
    erb :index
  else
    user_id = session[:user_id]
    @current_user = User.find(user_id)
    @tweets = @current_user.inverse_followers.map { |user| user.tweets }.flatten
    @tweets = @tweets.sort_by(&:created_at).reverse
    # raise @tweets.first.inspect
    erb :homepage
  end
end
