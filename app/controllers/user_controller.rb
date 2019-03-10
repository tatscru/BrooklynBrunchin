class UserController < AppController 

  get '/signup' do 
    if Helpers.logged_in?(session)
      redirect '/eateries'
    else 
      erb :'user/new_user'
    end 
  end 

  post '/signup' do 
    if Helpers.logged_in?(session)
      redirect :'/user/new_user'
    elsif params[:username] == '' || params[:password] = ''
  end 
  
  get '/login' do
    if !!Helpers.logged_in?(session)
      erb :'user/login'
    else 
      redirect '/eateries'
    end 
  end 

  

  # post do 
  # end 

end 