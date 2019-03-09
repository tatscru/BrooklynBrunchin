class UserController < AppController 
  get '/signup' do 
    if !!Helpers.logged_in?(session)
      erb :'user/new_user'
    else 
      redirect '/eateries'
    end 
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

  # post do 
  # end 

end 