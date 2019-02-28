require 'nokogiri'
require 'open-uri'
require 'pp'

doc = Nokogiri::HTML(open("http://www.nokogiri.org//"))
title = doc.xpath("html/head//title")

# printing the type of document
puts doc.class

# extracting the title of the web page
puts "\nTitle of this webpage is : #{title.inner_text}\n"

# parsing all of the links available on this web page
links = doc.xpath("//a[@href]")
puts "\nTotal number of links on this page is #{links.length} : \n"

# parsing and printing the name and hyperlink value of all those links
index = 1
links.each do |link|
  puts "#{index} - #{link.text} : #{link["href"]}"
  index += 1
end

# parsing a new HTML of one extracted link above (9th link) by providing its URL using Nokogiri parser value directly
install_doc = Nokogiri::HTML(open("http://www.nokogiri.org/#{links[8]["href"]}"))
install_types = install_doc.xpath("//ol")

# and printing some content of the same
puts "\nThree different ways to install Nokogiri are : \n"
puts install_types[0].inner_text

