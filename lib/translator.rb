class Translator
  def self.call(text:, to:)
    DeepL.translate(text, nil, to).text
  end
end
