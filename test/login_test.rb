require "test_helper"

class LoginTest < Minitest::Test
  def test_code2session_info_success
    stub_url = Regexp.new("#{WechatApp::Login::SESSION_KEY_URL}")
    stub_request(:get, stub_url).to_return(
      body: {
        openid: 'openid',
        session_key: 'session_key'
      }.to_json
    )
    res = WechatApp::Login.code2session_info('code', 'appid', 'appsecret')

    assert_equal res['openid'], 'openid'
    assert_equal res['session_key'], 'session_key'
  end

  def test_code2session_info_success
    stub_url = Regexp.new("#{WechatApp::Login::SESSION_KEY_URL}")
    stub_request(:get, stub_url).to_return(
      body: {
        errcode: 40029,
        errmsg: 'invalid code'
      }.to_json
    )

    assert_raises WechatApp::Login::Code2SessionInfoError do
      WechatApp::Login.code2session_info('code', 'appid', 'appsecret')
    end
  end
end
