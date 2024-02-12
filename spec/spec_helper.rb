require 'bundler'
Bundler.require(:default, :test)

Dir.glob('./lib/*.rb').each { |file| require file }
