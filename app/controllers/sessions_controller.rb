class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(name: params[:user][:name])

        authenticate = user.try(:authenticate, params[:user][:password])
    
        return redirect_to(controller: 'sessions', action: 'new') unless authenticate
    
        session[:user_id] = user.id
    
        @user = user
    
        redirect_to controller: 'welcome', action: 'home'
    end

    def destroy
    end
end