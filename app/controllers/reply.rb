post '/tweets/reply' do
  original = Tweet.find(params[:tweet][:id])
  original.replies << Tweet.create(params[:reply])
  redirect "/tweets/#{original.id}"
end