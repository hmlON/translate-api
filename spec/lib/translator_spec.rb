RSpec.describe Translator do
  describe '.call' do
    subject { described_class.(text: text, to: to) }
    let(:text) { 'Hello!' }
    let(:to) { 'uk' }

    before { allow(DeepL).to receive_message_chain(:translate, :text).and_return('Привіт!') }

    it 'translates to the selected language' do
      expect(subject).to eq('Привіт!')
    end

    context 'when there is an unsupported language'
  end
end
