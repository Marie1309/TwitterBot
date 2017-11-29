#!/usr/bin/env ruby

require 'rubygems'
require 'twitter'
require 'json'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "zJ3axD6CkVkaY6RWlDvsLxNUi"
  config.consumer_secret     = "dWpsIJjBG5NQOgyPQDzGz6IZHPhIzQ7mhaXkhstu7kZbcyMg82"
  config.access_token        = "933684496674836480-YduXVP7Vi3hyx5SbOFpB9G4gXSHWz7T"
  config.access_token_secret = "r7VD1f437wgAlmEhxy9cpUHwbUinjScL9XBFAC5jmaDTk"
end


  

  promotion = {
		"photo" => "/home/marie/Bureau/bracelet-fantaisie-tendance-2015-14354534.jpg",
  		"text" => "Code réduction: '10%' de réduction pour votre inscription à la newsletter à bague à Dames https://www.reduc.fr/bagueadames#show=55cd973ccf4bd0b13c7f874c"
  	}


client.search("#bijoux").take(10).each do |tweet|
  puts "#{tweet.user.screen_name}: #{tweet.text}"
      users = []
      users.push(tweet.user.id)
      puts tweet
      client.follow(users)
      client.favorite(tweet)
      client.update_with_media("@#{tweet.user.screen_name} " + promotion["text"], open(promotion["photo"]), {})

end

def run(client)
  retweetKeyword = "bijoux"
  while true
    re = client.search(retweetKeyword).first.id
    client.retweet(re);
    puts "Retweet: #{re} #{Time.now}";
    sleep(10); 
  end

  
end

