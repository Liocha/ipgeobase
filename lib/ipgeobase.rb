# frozen_string_literal: true

require_relative 'ipgeobase/version'
autoload(:IpMeta, 'ipgeobase/ip_meta.rb')

# top-level documentation comment for module Ipgeobase
module Ipgeobase
  $endpoint_api = 'http://ip-api.com/xml/'

  def self.lookup(ip)
    data = Net::HTTP.get(URI("#{$endpoint_api}#{ip}"))
    IpMeta.parse(data)
  end
end
