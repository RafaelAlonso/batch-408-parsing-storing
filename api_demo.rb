require 'json'
require 'open-uri'

puts "What is the GitHub username you want to check?"
username = gets.chomp

# TODO - Let's fetch name and bio from a given GitHub username
url = "https://api.github.com/users/#{username}"

serialized_url = open(url).read
url_as_object = JSON.parse(serialized_url)
puts "#{url_as_object["name"]} has #{url_as_object["followers"]} followers"
