get '/' do

  erb :index
end

post '/:username' do

  username = "@" + params[:username].gsub(/^@/, '')

  @user = TwitterUser.find_or_create_by(username: username)

  @filtered_user = @user.tweets_stale?

  if @filtered_user && request.xhr?
    erb :display_tweets, :layout => false
  else
    erb :no_user, :layout => false
  end
end