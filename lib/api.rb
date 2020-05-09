require 'net/http'
require 'open-uri'
require 'json'



# needs to make the call to the edsm api based on the use input from the cli class
# should have methods available for the options we choose to allow, again, will be limited for brevity

# a few notes on specific calls:

# url = "https://www.edsm.net/api-v1/sphere-systems\?systemName=Deciat\&radius=10\&showPrimaryStar=1"  
# uri = URI.parse(url)      
# uri.open
# request_result = uri.open   
# json_parse = JSON.parse(request_result)     

# json_parse.select {|item| item["primaryStar"]["type"]=="M (Red dwarf) Star"}    //this would return an array of systems in a 10ly radius of deciat that have red dwarf stars

# i need to give option to save/push a selected system to an array
# show less info on first diplay, give a Show Details option


class Api < Cli

  attr_accessor :name, :search_location, :system_search_parameter, :max_search_radius, :search_radius, :json_parse
  
  

  def initialize
    @name=name
  
    @search_location=search_location    
    @system_search_parameter=system_search_parameter
    @max_search_radius=max_search_radius
  end


  def self.request_systems_from_edsm(search_center, search_radius)
    puts "Fetching API Scraper"
    url = "https://www.edsm.net/api-v1/sphere-systems\?systemName=#{search_center}\&radius=#{search_radius}\&showPrimaryStar=1"
    uri = URI.parse(url)      
    uri.open
    request_result = uri.open   
    #binding.pry
    $json_parse = JSON.parse(request_result.read)   
    #binding.pry 
  end

  def self.display_api_results
    i = 1
    system "clear"
    Cli.print_line
    puts "Here are your search results, Commander:"
    $json_parse.each do |system|
      puts "#{i}: #{system}"
      i+=1
    end
    Cli.print_line
  end


end
