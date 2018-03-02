lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "wechat_app/version"

Gem::Specification.new do |spec|
  spec.name          = "wechat_app"
  spec.version       = WechatApp::VERSION
  spec.authors       = ["aczero"]
  spec.email         = ["lzh.scut@hotmail.com"]

  spec.summary       = %q{Library for wechat application(微信小程序) API}
  spec.description   = %q{Library for wechat application(微信小程序) API, wechat docs: https://mp.weixin.qq.com/debug/wxadoc/dev/api/api-login.html}
  spec.homepage      = "https://github.com/ACzero/wechat_app"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", "~> 2.0"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "webmock", "~> 3.3.0"
end
