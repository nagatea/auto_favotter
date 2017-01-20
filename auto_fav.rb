require "twitter"

stream_client = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = ENV['MY_CONSUMER_KEY']
      config.consumer_secret     = ENV['MY_CONSUMER_SECRET']
      config.access_token        = ENV['MY_ACCESS_TOKEN']
      config.access_token_secret = ENV['MY_ACCESS_TOKEN_SECRET']
end

client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['MY_CONSUMER_KEY']
      config.consumer_secret     = ENV['MY_CONSUMER_SECRET']
      config.access_token        = ENV['MY_ACCESS_TOKEN']
      config.access_token_secret = ENV['MY_ACCESS_TOKEN_SECRET']
end

stream_client.user do |status|
    if status.is_a?(Twitter::Tweet)
      client.favorite(status.id)
    end
end
