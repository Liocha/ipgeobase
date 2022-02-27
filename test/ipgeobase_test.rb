# frozen_string_literal: true

require 'test_helper'

class IpgeobaseTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_it_does_something_useful
    stub_request(:any, 'http://ip-api.com/xml/83.169.216.199')
      .to_return(body: File.read('test/fixtures/response.xml'), status: 200)

    ip_meta = Ipgeobase.lookup('83.169.216.199')
    assert { ip_meta.city == 'Baranchinskiy' }
    assert { ip_meta.country == 'Russia' }
    assert { ip_meta.countryCode == 'RU' }
    assert { ip_meta.lat == '58.1617' }
    assert { ip_meta.lon == '59.6991' }
  end
end
