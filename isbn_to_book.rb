#!/usr/bin/ruby

require 'open-uri'
require 'json'
require 'xmlsimple'
require 'pp'

file = "isbn.txt"
puts "title,titleTranscription,creator,creatorTranscription,publisher,publicationPlace,extent,materialType,description"

open(file){|f|
	f.each_line{|isbn|

begin  

	uri = "http://iss.ndl.go.jp/api/sru?operation=searchRetrieve&query=isbn=#{isbn.chomp}&recordSchema=dcndl_simple"
	#puts uri
	out = open(uri) {|f| f.read}
	result = XmlSimple.xml_in(out)

	book = result["records"][0]["record"][0]["recordData"][0]["dc"][0]
	puts "#{isbn.chomp},#{book["title"][0]},#{book["titleTranscription"][0]},#{book["creator"][0]},#{book["creatorTranscription"][0]}"

#	puts "#{book["title"][0]},#{book["titleTranscription"][0]},#{book["creator"][0]},#{book["creatorTranscription"][0]},#{book["publisher"][0]},#{book["publicationPlace"][0]},#{book["extent"][0]},#{book["materialType"][0]},#{book["description"][0]}"

rescue Exception => e  
  puts e.message  
  puts e.backtrace.inspect  
end  

	}
}



