# frozen_string_literal: true

require_relative 'ipgeobase/version'
autoload(:IpMeta, 'ipgeobase/ip_meta.rb')

# top-level documentation comment for module Ipgeobase
module Ipgeobase
  class Error < StandardError; end

  def self.lookup(ip)
    data = Net::HTTP.get(URI("http://ip-api.com/xml/#{ip}"))
    IpMeta.parse(data)
  end
end
