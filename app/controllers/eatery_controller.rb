class EateryController < AppController

  get '/eateries' do 
    if  Helpers.logged_in?(session)
      erb :'/eatery/eateries'
    else 
      redirect '/login'
    end 
  end 

  post '/eateries' do 
  end 

end 


 