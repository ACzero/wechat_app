require "test_helper"

class WechatAppTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::WechatApp::VERSION
  end
end
