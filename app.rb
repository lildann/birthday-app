require 'sinatra/base'
require 'sinatra/reloader'

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/birthday' do
    @name = params[:name]
    p params
    erb :birthday
  end

  run! if app_file == $0
end