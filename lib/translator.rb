class Translator
  def self.call(text:, to:)
    DeepL.translate(text, nil, to).text
  end

  def self.supported_languages
    DeepL.languages(type: :target).map(&:code)
  end
end
