class Translator
  def initialize(text:, to:)
    @text = text
    @to = to
  end

  def perform
    text
  end

  private

  attr_reader :text, :to
end
