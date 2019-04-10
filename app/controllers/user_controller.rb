class UserController < AppController 

  get '/signup' do 
    if !logged_in?
      erb :'user/new_user'
    else 
      redirect '/eateries'
    end 
  end 

  post '/signup' do 
    if !params.has_value?("")
      user= User.create(username: params[:username], password: params[:password], email: params[:email])
      session[:user_id] = user.id 
      redirect '/eateries'
    else 
      redirect '/signup'
    end
  end  
  
  get '/login' do
    if !logged_in?
      erb :'user/login'
    else 
      redirect '/eateries'
    end 
  end 

  post '/login' do 
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect '/eateries'
    else 
      flash[:login_error] = "Incorrect login. Please try again."
      redirect '/login'
    end 
  end 

  get '/logout' do 
    if logged_in?
      session.clear 
      redirect '/login'
    else 
      redirect '/'
    end 
  end 

end 