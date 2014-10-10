post '/auth' do
  user = User.find_by(username: params[:username])
  if user == nil
    redirect '/users/sign_up'
  elsif user.password_hash == params[:password]
    session[:user_id] = user.id
    redirect "/#{user.username}"
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

get '/:username' do
  @user = User.find_by(username: params[:username])
  @tweets = @user.tweets
  @tweets = @tweets.sort_by(&:created_at).reverse
  erb :user_page
  # @user = User.find_by(username: params[:username])
  # if session[:user_id] == @user.id
  #   @tweets = @user.tweets
  #   erb :user
  # else
  #   erb :sign_up
  # end
end
