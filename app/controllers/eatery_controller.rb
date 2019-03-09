class EateryController < AppController
  get '/eateries' do 
    if Helpers.logged_in?
      erb :eateries 
      #show them a full list of eateries 
    else 
      redirect '/login'
    end 
  end 

  get '/eateries/new' do 
  end 

  post '/eateries' do 
  end 
end 