require 'rest-client'

module WechatApp
  module Login
    class Code2SessionInfoError < StandardError; end

    class << self
      SESSION_KEY_URL = "https://api.weixin.qq.com/sns/jscode2session"

      def code2session_info(code, wxa_appid, wxa_secret)
        req_params = {
          appid: wxa_appid,
          secret: wxa_secret,
          js_code: code,
          grant_type: 'authorization_code'
        }

        res = JSON.parse(RestClient.get(SESSION_KEY_URL, { params: req_params }))
        if res['errcode'].present?
          raise Code2SessionInfoError.new("get session info fail: #{res}")
        else
          res
        end
      end
    end
  end
end
