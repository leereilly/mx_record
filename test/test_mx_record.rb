require 'helper'

class TestMxRecord < Test::Unit::TestCase
  should "obtain the highest priority mail server" do
    mx_server = MXRecord::primary_server('google.com')
    assert_equal 'aspmx.l.google.com', mx_server
  end

  should "obtain all of the mail servers" do
    mx_servers = MXRecord::mail_servers('google.com')
    assert_equal 5, mx_servers.size
  end

end
