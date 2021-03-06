require 'sinatra/base'
require './lib/app.rb'
require 'data_mapper'
require 'rack-flash'

class FiveASide < Sinatra::Base

  env = ENV['RACK_ENV'] || 'development'

  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/five_a_side_#{env}")

  require './lib/models/player.rb'
  require './lib/models/post.rb'

  DataMapper.finalize

  DataMapper.auto_upgrade!

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
  use Rack::MethodOverride

  def current_player
    @current_player ||=Player.get(session[:player_id]) if session[:player_id]
  end

  app = App.new

  get '/' do
    erb :index
  end

  get '/new_user' do
    erb :new_user
  end

  post '/registering' do
    if params[:username_register].length != 0
      app.add_player(params[:username_register])
      @player = Player.new(username: app.players.last)
      if @player.save
        session[:player_id] = @player.id
        redirect to('/main')
      else
        flash.now[:notice] = 'This username is already taken'
        erb :new_user
      end
    else
      flash.now[:notice] = 'Please enter a valid username'
      erb :new_user
    end
  end

  post '/sessions' do
    username = params[:username_login]
    if Player.first(username: username)
      player = Player.first(username: username)
      session[:player_id] = player.id
      redirect to('/main')
    else
      flash.now[:notice] = 'This username is not in the system'
      erb :index
    end
  end

  get '/main' do
    current_player
    @app = app
    @team1 = app.team_one
    @team2 = app.team_two
    erb :main
  end

  post '/playing' do
    name = current_player.username
    if app.too_many_players? && app.available_players.include?(name) == false
      flash[:notice] = "Sorry, the game is full"
      redirect to('/main')
    elsif app.too_many_players? && app.available_players.include?(name)
      app.available_players.delete(name)
    else
      app.available(name)
      Player.first(username: name).update(available: true)
    end
    redirect to('/main')
  end

  post '/reset' do
    app.reset_available_players
    redirect to('/main')
  end

  post '/reset_teams' do
    app.reset_teams
    redirect to('/')
  end

  post '/generate' do
    app.generate_teams()
    @team1 = app.team_one
    @team2 = app.team_two
    redirect to('/main')
  end

  get '/forum' do
    @posts = Post.all
    erb :forum
  end

  post '/forum-post' do
    content = params[:post]
    @post = Post.create(content: content, player_id: current_player.id, created_at: Time.now)
    redirect to('/forum')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
