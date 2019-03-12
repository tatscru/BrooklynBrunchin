class EateryController < AppController

  #Read
  get '/eateries' do 
    if  Helpers.logged_in?(session)
      @eateries = Eatery.all
      erb :'eatery/eateries'
    else 
      redirect '/login'
    end 
  end 

  #Create
  get '/eateries/new' do 
    if Helpers.logged_in?(session) 
      erb :'/eatery/new'
    else 
      flash[:message] = "Oops! It looks like you have not logged in yet."
      redirect '/login'
    end 
  end 
  
  # Create
  post '/eateries' do 
    user= Helpers.current_user(session)
    if params[:name] == "" || params[:cuisine] == "" || params[:rating] == "" || params[:content] == "" || params[:number] == ""
      flash[:message] = "To give a proper review, please fill out the necessary information."
      redirect to '/eatery/new'
    end 
      @eateries = Eatery.create(name: params[:name], cuisine: params[:cuisine], rating: params[:rating], content: params[:content], number: params[:number], user_id: user.id)
      redirect '/eateries'
    end 
  end 

  get '/eatery/:id' do
    if !Helpers.is_logged_in?(session)
      redirect to '/login'
      flash[:message] = "Looks like you weren't logged in yet. Please log in below."
    elsif
      @eateries.user_id == session[:user_id]
      erb :'/show_eatery'
    else 
      @eateries.user_id != session[:user_id]
      erb :"eatery/eateries"
    end 
  end

  #Edit/Update
  get '/eatery/:id/edit' do
    if !Helpers.is_logged_in?(session)
      flash[:message] = "Looks like you weren't logged in yet. Please log in below."
      redirect to '/login'
    end
    @eateries = Eatery.find(params[:id])
    if Helpers.current_user(session).id != @eateries.user_id
      flash[:wrong_user_edit] = "Sorry you can only edit restaurants that you yourself have reviewed"
      redirect to '/eateries'
    end
    erb :"/edit_eatery"
  end

  # post '/eateries' do 
  #   user = Helpers.current_user(session)
  #   if !params.has_value("")
  #     redirect to '/eateries/new'
  #   else
  #     eateries = Eatery.create(name: params[:name], cuisine: params[:cuisine], rating: params[:rating], content: params[:content], number: params[:number], user_id: user.id)
  #     redirect to '/eateries'
  #   end 
  # end
# end 



 