# WechatApp

[微信小程序](https://mp.weixin.qq.com/debug/wxadoc/dev/api/api-login.html)相关API库

## 安装

在Gemfile中添加:

```ruby
gem 'wechat_app'
```

然后运行:

    $ bundle

或者:

    $ gem install wechat_app

## 使用

### code 换取 session_key

参考文档: https://mp.weixin.qq.com/debug/wxadoc/dev/api/api-login.html#wxloginobject

```ruby

WechatApp::Login.code2session_info('code', 'appid', 'appsecret')
# 具体返回结构参考微信文档
# => { "openid": "openid", "session_key": "session_key" }

```

### 用户数据的签名验证和加解密

参考文档: https://mp.weixin.qq.com/debug/wxadoc/dev/api/signature.html

#### 数据签名校验

``` ruby

WechatApp::UserInfo.data_valid?('raw_data', 'session_key'', 'signature'')
# => true

```

#### 加密数据解密(获取用户信息)

``` ruby

WechatApp::UserInfo.decrypt_data('encrypted_data', 'session_key', 'iv')
# =>{
#    	"openId": "OPENID",
#    	"nickName": "NICKNAME",
#    	"gender": GENDER,
#    	"city": "CITY",
#    	"province": "PROVINCE",
#    	"country": "COUNTRY",
#    	"avatarUrl": "AVATARURL",
#    	"unionId": "UNIONID",
#    	"watermark":
#    	{
#       	"appid":"APPID",
#        	"timestamp":TIMESTAMP
#    	}
#}

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/wechat_app. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the WechatApp project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/wechat_app/blob/master/CODE_OF_CONDUCT.md).
