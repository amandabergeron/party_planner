class ApplicationController < ActionController::Base
  #before_filter :authenticate_user!
  protect_from_forgery
 
  #def authorized
    #unless User.find_by_id(session[:user_id])
      #redirect_to loging_url, :notice => "Please log in"
  #end
#end
  
end
