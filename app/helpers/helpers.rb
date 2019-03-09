class Helpers 
  def self.current_user
    @user= User.find_by(session[:user_id])
  end 

  def self.logged_in?
    !!!@user 
  end 
end 
