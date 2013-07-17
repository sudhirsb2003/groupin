class ApplicationController < ActionController::Base
  protect_from_forgery
  
    rescue_from CanCan::AccessDenied do |exception|
     redirect_to main_app.root_url, :alert => exception.message
    end

    def check_session
     if session[:user]
       if session[:expiry_time] < 1.minutes.ago
         reset_session
       flash[:warning] = 'You waass logout.' 
         redirect_to root_url
       else
         session[:expiry_time] = Time.now
       end
     else
       #... authenticate
       session[:expiry_time] = Time.now
       flash[:warning] = 'You wass logout.' 
       redirect_to root_url
     end
    end  


end
