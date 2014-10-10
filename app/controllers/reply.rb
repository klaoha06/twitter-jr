post '/tweets/reply' do
  Reply.create(params[:reply])
  redirect "/tweets/#{params[:reply][:tweet_id]}"
end