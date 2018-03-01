module WechatApp
  module UserInfo
    class DecryptedDataFormatError < StandardError; end

    class << self
      def data_valid?(raw_data, session_key, signature)
        sign_str = "#{raw_data}#{session_key}"
        Digest::SHA1.hexdigest(sign_str) == signature
      end

      def decrypt_data(encrypted_data, session_key, iv)
        encrypted = Base64.strict_decode64(encrypted_data)
        decipher = OpenSSL::Cipher::AES128.new(:CBC)
        decipher.decrypt
        decipher.key = Base64.strict_decode64(session_key)
        decipher.iv = Base64.strict_decode64(iv)

        decrypted_data = decipher.update(encrypted) + decipher.final

        begin
          JSON.parse(decrypted_data)
        rescue JSON::ParserError => e
          msg = <<~MSG
          decrypted_data parse error: #{e.message}
          decrypted_data: #{decrypted_data}
          MSG
          raise DecryptedDataFormatError.new(msg)
        end
      end
    end
  end
end
