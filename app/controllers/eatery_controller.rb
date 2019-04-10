class EateryController < AppController

  #Read
  get '/eateries' do 
    if  logged_in?
      @eateries = Eatery.all 
      erb :'eatery/eateries'
    else 
      redirect '/login'
    end 
  end 

  #Create
  get '/eateries/new' do 
    if logged_in? 
      erb :'/eatery/new'
    else 
      flash[:message] = "Oops! It looks like you have not logged in yet."
      redirect '/login'
    end 
  end   
  

  post '/eateries' do 
    user= current_user
    if params[:name] == "" || params[:cuisine] == "" || params[:rating] == "" || params[:content] == "" || params[:number] == ""
      flash[:message] = "To give a proper review, please fill out all sections."
      redirect to '/eatery/new'
    else 
      # eatery = Eatery.create(name: params[:name], cuisine: params[:cuisine], rating: params[:rating], content: params[:content], number: params[:number], user_id: user.id)
      user.eateries.create(name: params[:name], cuisine: params[:cuisine], rating: params[:rating], content: params[:content], number: params[:number])
      redirect '/eateries'
    end 
  end 

  get '/eateries/:id' do
    if !current_user
      redirect to '/login'
      flash[:message] = "Looks like you weren't logged in yet. Please log in below."
    end 
    @eatery = Eatery.find_by(params[:id])
    erb :'/eatery/show_eatery'
  end

  #Edit/Update
  get '/eateries/:id/edit' do
    @eatery = Eatery.find(params[:id])
    if current_user.id == @eatery.user_id
      erb :"/eatery/edit_eatery"
    else 
      flash[:wrong_user_edit] = "Sorry you can only edit restaurants that you yourself have reviewed"
      redirect '/eateries'
    end 
  end

  patch '/eateries/:id' do 
    if params[:name] == "" || params[:cuisine] == "" || params[:rating] == "" || params[:content] == ""
      flash[:message] = "Try again, please update all category fields."
      redirect to "/reviews/#{params[:id]}/edit"
    end 
    eatery = Eatery.find_by(params[:id])
    if current_user.id == eatery.user_id

      eatery.update({ name: params[:name], cuisine: params[:cuisine], rating: params[:rating], content: params[:content], number: params[:number] })
      flash[:messsage] = "Your review has been updated!"
      redirect "/eateries"
    else 
      # flash message or request.refer helper 
    end 
  end 

  delete '/eateries/:id/delete' do 
    if logged_in? 
      @eatery = Eatery.find_by(params[:id])
      if current_user.id == @eatery.user_id
        @eatery.destroy
        flash[:message] = "You have just deleted a review."
        redirect to "/eateries"
      end 
    else 
      flash[:message] = "Looks as though you have not logged in yet."
      redirect '/login'
    end 
  end 
end