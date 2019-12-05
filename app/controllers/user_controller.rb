class UserController < ApplicationController
    before_action :authenticate_user!
        def login
        session[:login] = 1
        session[:cart] = nil
        flash[:notice] = "Login sucessfull!!"
        redirect_to :controller => :items
    end 
    
    def logout
        session[:login] = nil
        session[:cart] = nil
        flash[:notice] = "You have been successfully logged out!!"
        redirect_to :controller => :items
    end
end
