class Translator
  def self.call(text:, to:)
    # TODO: cache
    DeepL.translate(text, nil, to).text
  end

  def self.supported_languages
    # TODO: cache
    DeepL.languages(type: :target).map(&:code)
  end
end
