# assuptions:
# - the service is going to be available only for the internal usage,
#   otherwise I'd add some sort of a check for origin of the request

require 'sinatra/base'
require 'sinatra/param'
require './config'
Dir.glob('./lib/*.rb').each { |file| require file }

class App < Sinatra::Base
  helpers Sinatra::Param

  before do
    content_type :json
  end

  post '/translate' do
    param :text, String, required: true
    param :to,   String, required: true, in: Translator.supported_languages, transform: :upcase

    { translation: Translator.(text: params[:text], to: params[:to]) }.to_json
  end
end
