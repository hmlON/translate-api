RSpec.describe 'App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
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

    context 'when text is empty' do
      let(:text) { nil }

      # it "returns an error" do
      #   subject
      #   expect(JSON.parse(last_response.body)['translation']).to eq 'Привіт!'
      # end
    end
  end
end
