require 'sinatra/base'
require './lib/app.rb'

class FiveASide < Sinatra::Base
  get '/' do
    
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
