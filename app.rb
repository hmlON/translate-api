# assuptions:
# - the service is going to be available only for the internal usage,
#   otherwise I'd add some sort of a check for origin of the request

require 'sinatra'
require './config'
Dir.glob('./lib/*.rb').each { |file| require file }

get '/' do
  Translator.(text: 'Hello, world!', to: 'uk')
end

post '/translate' do
  # :text is not empty
  # :to is present and included in languages
  Translator.(text: params[:text], to: params[:to])
end
