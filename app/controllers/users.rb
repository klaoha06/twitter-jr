post '/auth' do
  @user = User.find_by(username: params[:username])
  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/#{@user.username}'
  else
    redirect '/users/sign_up'
  end
end

get '/users/sign_up' do
  erb :sign_up
end

post '/users/new' do
  @user = User.new(params[:User])
  if @user.save
    session[:user_id] = @user.id
    redirect "/#{@user.username}"
  else
   redirect '/'
  end
end

get '/:username/followers' do
@list = User.find_by(username: params[:username]).followers   #finding user with a username attribute equal to :username in URL, returns followers
erb :follows
end

get '/:username/following' do
@list = User.find_by(username: params[:username]).inverse_followers  #finding user with a username attribute equal to :username in URL, returns inverse_followers
erb :follows
end

get '/:username' do
  @user = User.find_by(username: params[:username])
  @tweets = @user.tweets
  @tweets = @tweets.sort_by(&:created_at).reverse
  # @display_delete = @tweets.user.id == session[:user_id]
  erb :user_page
  # @user = User.find_by(username: params[:username])
  # if session[:user_id] == @user.id
  #   @tweets = @user.tweets
  #   erb :user
  # else
  #   erb :sign_up
  # end
end

post '/follow/new' do
  current_user = User.find(session[:user_id])
  other_user = User.find(params[:user_id])
  current_user.inverse_followers << other_user
  current_user.save
  redirect "/#{other_user.username}"
end

post '/unfollow/new' do
  current_user = User.find(session[:user_id])
  other_user = User.find(params[:user_id])
  current_user.inverse_followers.delete(other_user)
  current_user.save
  redirect "/#{other_user.username}"
end