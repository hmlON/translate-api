require 'bundler'
Bundler.require(:default, :test)

require 'rspec'
require 'rack/test'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

require './app'
