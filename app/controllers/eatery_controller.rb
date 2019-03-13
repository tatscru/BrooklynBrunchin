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
  

  post '/eateries' do 
    user= Helpers.current_user(session)
    if params[:name] == "" || params[:cuisine] == "" || params[:rating] == "" || params[:content] == "" || params[:number] == ""
      flash[:message] = "To give a proper review, please fill out all sections."
      redirect to '/eatery/new'
    else 
      eatery = Eatery.create(name: params[:name], cuisine: params[:cuisine], rating: params[:rating], content: params[:content], number: params[:number], user_id: user.id)
      redirect '/eateries'
      end 
    end 
  end 

  get '/eatery/:id' do
    if !Helpers.is_logged_in?(session)
      redirect to '/login'
      flash[:message] = "Looks like you weren't logged in yet. Please log in below."
    end 
      @eatery = Eatery.find_by(session[:user_id])
      erb :'/show_eatery'
    else 
      @eatery.user_id != session[:user_id]
      erb :"eatery/eateries"
    end 
  end

  #Edit/Update
  get '/eatery/:id/edit' do
    if !Helpers.logged_in?(session)
      flash[:message] = "Looks like you weren't logged in yet. Please log in below."
      redirect '/login'
    end
    @eatery = Eatery.find(params[:id])
    if Helpers.current_user(session).id == session[:user_id]
      erb :"/edit_eatery"
    else 
    flash[:wrong_user_edit] = "Sorry you can only edit restaurants that you yourself have reviewed"
      redirect '/eateries'
    end 
  end

 patch '/eateries/:id' do 
  if params[:name] == "" || params[:cuisine] == "" || params[:rating] == "" || params[:content] == ""
      flash[:message] = "Try again, please update all category fields."
      redirect to "/reviews/#{params[:id]}/edit"
  eatery = Eatery.find_by(params[:id])

  eatery.update(params[:name], params[:cuisine], params[:rating], params[:content], params[:number])
  eatery.save 
  flash[:messsage] = "Your review has been updated!"
  redirect "/eateries/#{@eatery.id}"
 end 

 delete '/delete/:id/delete' do 
  if Helpers.logged_in? 
    @eatery = Eatery.find_by(session[:id])
    if @eatery.user_id == session[:user_id]
      @eatery.delete
      flash[:message] = "You have just deleted a review."
    end 
  else 
    flash[:message] = "Looks as though you have not logged in yet."
    redirect '/login'
  end 
end 

end 



 