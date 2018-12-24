require 'twitter'

$client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "OlBcM8Vgl3gqO1VY129quk1oN"
  config.consumer_secret     = "2SXw3fIF0IgmGVg1MtXle7Bwa4rQ8eW8CfQvev90t36jUbCoj1"
  config.access_token        = "1075817653539889152-KRmQNUi96L7dundEgo7JtQK9wo4oDm"
  config.access_token_secret = "BIPB1WMZ9gy4TVU6E0V2tOvUlxrndROX3VhllCGPMcfqc"
end