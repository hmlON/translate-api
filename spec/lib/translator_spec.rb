RSpec.describe Translator do
  let(:instance) { described_class.new(text: text, to: to) }
  let(:text) { 'asd' }
  let(:to) { 'uk' }

  describe '.perform' do
    subject { instance.perform }

    xit 'translates to the selected language' do
      expect(subject).to eq('asd')
    end

    context 'when there is an unsupported language'
  end
end
