namespace :tweets do
  require 'csv'

  analyzer = Sentimental.new

  keywords = %w(election2016 maga trump hillary)

  tweets_attributes = %w(tweet_id user_id content retweets_count created_at sentiment)

  tweets_path = "#{Rails.root}/storage/tweets.csv"
  retweets_path = "#{Rails.root}/storage/retweets.csv"
  users_tweets = "#{Rails.root}/storage/users_tweets.csv"

  task :collect => :environment  do |task|
    begin
      retweets_attributes = %w(tweet_id retweet_id user_id retweeted_at sentiment)

      tweets_count = 0
      retweets_count = 0

      unless File.exist?(tweets_path)
        CSV.open(tweets_path, 'w') do |tweet_csv|
          tweet_csv << tweets_attributes

          keywords.each do |keyword|
            puts "Getting tweets for keyword: #{keyword}..."

            tweets = $client.search("##{keyword} -rt", lang: 'en')

            tweets.each do |tweet|
              tweet_row = [tweet.id, tweet.user.id, tweet.text, tweet.retweet_count,
                           tweet.created_at, analyzer.sentiment(tweet.text)]
              tweet_csv << tweet_row

              tweets_count += 1
            end
          end
        end

        puts "#{tweets_count} tweets found"
      end

      unless File.exist?(retweets_path)
        CSV.open(retweets_path, 'w') do |retweet_csv|
          retweet_csv << retweets_attributes

          CSV.foreach(tweets_path, headers: true) do |tweet|
            if tweet['retweets_count'].to_i > 10
              $client.retweets(tweet['tweet_id']).each do |retweet|
                retweet_row = [tweet['tweet_id'], retweet.id, retweet.user.id, retweet.created_at, tweet['sentiment']]
                retweet_csv << retweet_row

                retweets_count += 1
              end
            end
          end
        end

        puts "#{retweets_count} retweets found"
      end

      puts "Finished!"

    rescue => e
      puts "Error: #{e.message}"
    end
  end

  task :evaluate => :environment  do |task|
    begin
      users_tweets_attributes = tweets_attributes + %w(from_tweet_id from_tweet_sentiment)

      CSV.open(users_tweets, 'w') do |user_tweet_csv|
        user_tweet_csv << users_tweets_attributes

        CSV.foreach(retweets_path, headers: true) do |retweet|
          puts "Getting user: #{retweet['user_id']} tweets based on tweet #{retweet['tweet_id']}"

          $client.user_timeline(retweet['user_id'].to_i).take(3).each do |tweet|
            tweet_row = [tweet.id, tweet.user.id, tweet.text, tweet.retweet_count,
                         tweet.created_at, analyzer.sentiment(tweet.text), retweet['tweet_id'], retweet['sentiment']]

            user_tweet_csv << tweet_row
          end
        end
      end

      puts "Finished!"
    rescue => e
      puts "Error: #{e.message}"
    end
  end

end
