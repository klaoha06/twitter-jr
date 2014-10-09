post '/auth' do
  user = User.find_by(username: params[:username])
  if user == nil
    redirect '/users/sign_up'
  elsif user.password_hash == params[:password]
    session[:user_id] = user.id
    redirect "/users/#{user.username}"
  end
end

get '/users/sign_up' do
  erb :sign_up
end

post '/users/new' do
  @user = User.new(params[:User])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.username}"
  else
   redirect '/'
  end
end

get '/users/:username' do
  @user = User.find_by(username: params[:username])
  if session[:user_id] == @user.id
    erb :user
  else
    erb :sign_up
  end
end

get 'users/:id' do
  p session
  @user = User.find(user_id)
  @url = @user.urls.find(params[:id])
  erb :display_page
end
