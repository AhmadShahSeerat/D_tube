class SessionsController < ApplicationController
    # new/create route should just create a new session
    def new

    end

    def create
        @user = User.find_by_username(params[:user][:username])

        if @user && @user.authenticate(params[:user][:password])
            flash[:message] = "Succesful sign in"
            session[:user_id] = @user.id
            redirect_to designs_path
        else
            flash[:message] = "Invalid Credentials"
            render :new
        end
    end

    def omniauth
    end

    def logout
        session.clear 
        redirect_to login_path 
    end
end

