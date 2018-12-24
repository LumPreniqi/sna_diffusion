class ApplicationController < ActionController::Base

  def test
    arr = []

    $client.user_timeline(393855734).take(3).each do |tweet|
      arr << tweet
    end

    render json: arr
  end
end
