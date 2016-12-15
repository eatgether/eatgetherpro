# 配置 appkey 和 appsecret
# 如果使用rails 可以放到 config/initializers/alidayu.rb

Alidayu.appkey = ""
Alidayu.appsecret = ""

# 发短信
# 必须参数
# template_id       模版ID  String
# params            模版参数 Hash
# phones            电话号码 String or String[]
# sign_name         签名

# 具体文档 http://open.taobao.com/doc2/apiDetail?apiId=25450

Alidayu.send_sms({
  template_id: "SMS_0000000",
  sign_name: "身份验证",
  params: {
    code: '',
    product: '',
  },
  phones: "填写电话号码"
})
