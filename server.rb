require 'sinatra/base'
require './lib/app.rb'
require 'data_mapper'
require 'rack-flash'

class FiveASide < Sinatra::Base

  env = ENV['RACK_ENV'] || 'development'

  DataMapper.setup(:default, "postgres://localhost/five_a_side_#{env}")

  require './lib/models/player.rb'

  DataMapper.finalize

  DataMapper.auto_upgrade!

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
  use Rack::MethodOverride

  get '/' do
    erb :index
  end

  post '/registering' do
    @player = Player.new(username: params[:username_register])
    if @player.save
      session[:player] = @player.id
      redirect to('/main')
    else
      flash.now[:notice] = 'This username is already taken'
      erb :index
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
