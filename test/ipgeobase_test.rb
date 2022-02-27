# frozen_string_literal: true

require 'test_helper'

class IpgeobaseTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_it_does_something_useful
    assert true
  end

  def test_req
    stub_request(:post, 'www.example.com')
      .with(body: 'abc', headers: { 'Content-Length' => 3 })

    uri = URI.parse('http://www.example.com/')
    req = Net::HTTP::Post.new(uri.path)
    req['Content-Length'] = 3

    res = Net::HTTP.start(uri.host, uri.port) do |http|
      http.request(req, 'abc')
    end
  end
end
