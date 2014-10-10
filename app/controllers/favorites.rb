get '/favorites/:id' do
  original = Tweet.find(params[:id])
  original.favorites << Tweet.create(original_id: params[:id], text: "#{original.text}", user_id: session[:user_id])
  redirect back
end
