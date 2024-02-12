class Translator
  def self.call(text:, to:)
    # TODO: validate language
    DeepL.translate(text, nil, to).text
  end
end
