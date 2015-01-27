require 'sinatra/base'
require './lib/app.rb'
require 'data_mapper'

class FiveASide < Sinatra::Base

  env = ENV['RACK_ENV'] || 'development'

  DataMapper.setup(:default, "postgres://localhost/five_a_side_#{env}")

  # require the file that we want to store in the database

  DataMapper.finalize

  DataMapper.auto_upgrade!

  get '/' do

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
