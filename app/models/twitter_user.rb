class TwitterUser < ActiveRecord::Base
  attr_accessor :client
  has_many :tweets

  def fetch_tweets!
    fetch_tweets(self.username)
  end

  def tweets_stale?
    if self.tweets.empty? || (test = Time.now - self.tweets.first.created_at > 900)
      self.tweets.destroy_all
      fetch_tweets!
    else
      self
    end
  end
end