require 'open-uri'
require 'nokogiri'

url = "https://www.bbcgoodfood.com/search/recipes?query=chocolate"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.teaser-item__title a').each do |element|
  path =  element.attributes["href"].value
  next_url = "https://www.bbcgoodfood.com#{path}"

  recipe_file = open(url).read
  recipe_doc = Nokogiri::HTML(html_file)
end

