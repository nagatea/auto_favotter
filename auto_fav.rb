require "twitter"
require "./time.rb"

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

begin
      fav_retry ||= 0
      client.update("auto_favotterを再起動しました。\n#{time_code}")
      stream_client.user do |status|
          if status.is_a?(Twitter::Tweet)
            client.favorite(status.id)
          end
      end
      
rescue => exception
      fav_retry += 1
      client.update("エラーが発生したのでauto_favotterを停止しました。(リトライ回数#{fav_retry}回目)\n#{exception.message}\n#{time_code}")
      retry if fav_retry < 5
end
