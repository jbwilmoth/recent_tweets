def fetch_tweets(username)
  user = TwitterUser.find_by_username(username)
  begin
  $client.user_timeline(username, count: 10).each do |tweet|
    user.tweets << Tweet.create(content: tweet.text)
  end
  rescue Twitter::Error
    return nil
  end
  user
end