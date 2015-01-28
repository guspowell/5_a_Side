require 'sinatra/base'
require './lib/app.rb'
require 'data_mapper'

class FiveASide < Sinatra::Base

  env = ENV['RACK_ENV'] || 'development'

  DataMapper.setup(:default, "postgres://localhost/five_a_side_#{env}")

  require './lib/models/player.rb'

  DataMapper.finalize

  DataMapper.auto_upgrade!

  get '/' do
    erb :index
  end

  post '/registering' do
    @player = Player.new(username: params[:username_register])
    @player.save
    session[:player] = @player.id
    redirect to('/')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
