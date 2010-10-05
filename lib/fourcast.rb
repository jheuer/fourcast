require 'rubygems'
require 'httparty'

class Fourcast
  include HTTParty
  base_uri 'api.fourcastapp.com/v1'
  
  def initialize(auth)
    @api_key = auth[:api_key]
  end
  
  # fourcast = Fourcast.new(:api_key => '195070f46e2e787e')
  # puts fourcast.venue(11761).inspect
  def venue(vid, options = {})
    options.merge!({ :query => { :key => @api_key } })
    self.class.get("/venues/#{vid}", options)
  end
end
