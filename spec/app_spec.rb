RSpec.describe App do
  include Rack::Test::Methods

  def app
    App
  end

  # before { allow(Translator).to receive(:call).and_return('Привіт!') }

  describe 'POST /translate' do
    let(:text) { 'Hello!' }
    let(:to) { 'uk' }

    subject { post '/translate', text: text, to: to }

    it "translates" do
      subject
      expect(JSON.parse(last_response.body)['translation']).to eq 'Привіт!'
    end

    describe 'text' do
      context 'when it is empty' do
        let(:text) { nil }

        it "returns an error" do
          subject
          expect(JSON.parse(last_response.body)['errors']['text']).to eq 'Parameter is required'
        end
      end
    end

    describe 'to' do
      context 'when it is empty' do
        let(:to) { nil }

        it "returns an error" do
          subject
          expect(JSON.parse(last_response.body)['errors']['to']).to eq 'Parameter is required'
        end
      end

      context 'when it is not included in the supported languages' do
        let(:to) { 'memes' }

        it "returns an error" do
          subject
          expect(JSON.parse(last_response.body)['errors']['to']).to start_with 'Parameter must be within ['
        end
      end
    end
  end
end
