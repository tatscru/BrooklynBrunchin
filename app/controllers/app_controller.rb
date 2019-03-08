class AppController < Sinatra::Base 
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "maxahmillionf00ds"
  end

  get '/' do
    @users = User.all 

    erb :index
  end 
end 