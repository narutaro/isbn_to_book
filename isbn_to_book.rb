#!/usr/bin/ruby

require 'open-uri'
require 'json'
require 'xmlsimple'
require 'pp'
#require 'nokogiri'

uri = "http://iss.ndl.go.jp/api/sru?operation=searchRetrieve&query=isbn=9784265916139&recordSchema=dcndl_simple"
out = open(uri) {|f| f.read}
#o = JSON.load(out)

#p o

#doc = Nokogiri::XML(o)
#pp o

config = XmlSimple.xml_in(out)
#pp config

pp config["records"][0]["record"][0]["recordData"][0]["dc"][0]

#config["records"].each do |a|
#	puts "---------------#{a}"
#end

#puts config["titleTranscription"]
#puts config["xmlns:xsi"]

