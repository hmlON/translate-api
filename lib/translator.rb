require 'deepl'

DeepL.configure do |config|
  config.auth_key = ENV['DEEPL_AUTH_KEY']
  config.host = 'https://api-free.deepl.com'
end

class Translator
  def self.call(text:, to:)
    DeepL.translate(text, nil, to).text
  end
end
