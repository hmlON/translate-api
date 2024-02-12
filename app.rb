# assuptions:
# - the service is going to be available only for the internal usage,
# otherwise, I'd add some sort of a check for origin of the request

require 'dotenv/load'
require 'sinatra'

get '/' do
  'Hello world!'
end
