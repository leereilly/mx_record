require 'helper'

class TestMxRecord < Test::Unit::TestCase
  should "probably rename this file and start testing for real" do
    mx_server = MXRecord::get_server('google.com')
    assert_equal 'aspmx.l.google.com', mx_server
  end
end
