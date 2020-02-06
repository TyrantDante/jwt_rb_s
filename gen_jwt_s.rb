require 'jwt'

puts "请输入kid:"
kid = gets.chomp
puts "请输入iusserid"
iss = gets.chomp
puts "请输入kid对应的证书地址"
path = gets.chomp


ecdsa_key = OpenSSL::PKey::EC.new File.read path
ecdsa_key.private? #=>true

payload = {
    "iss": iss,
    "exp": Time.now.to_i + 1200,
    "aud": "appstoreconnect-v1"
  }

header = {
    "alg": "ES256",
    "kid": kid,
    "typ": "JWT"
  }

token = JWT.encode payload, ecdsa_key, 'ES256',header

puts "生成Token成功有效时间是20分钟："
puts token
