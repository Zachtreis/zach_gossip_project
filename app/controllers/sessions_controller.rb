class SessionsController < ApplicationController

    def index
    end

    def show
    end

    def new
    end

    def create
        user = User.find_by(email: params[:email].downcase)
        if user && user.authenticate(params[:password])
            log_in(user)
            params[:remember_me] == '1' ? remember(user) : forget(user)
            flash[:notice] = "Bienvenue #{user.first_name} !"
            redirect_to root_path
        else
            flash.now[:danger] = 'Invalid email/password combination'
            render 'new'
        end
    end

    def edit
    end

    def update
    end

    def destroy
        log_out if logged_in?
        redirect_to root_path
    end

end
