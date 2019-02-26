class UsersController < ApplicationController

    def index
        @users = User.all
    end

      
    def show
        @user = User.find(params[:id])
        @gossips =[]
        gossip = Gossip.all
        gossip.each do |gossip|
            if gossip.user.id == @user.id
                @gossips << gossip
            end
        end
    end

    def new
        @user = User.new
      end
    
    def create
        @user = User.new(first_name: params[:first_name],
                         last_name: params[:last_name],
                         description: params[:description],
                         email: params[:email],
                         age: params[:age],
                         password: params[:password],
                         city_id: City.all.sample.id)
        if @user.save # essaie de sauvegarder en base @gossip
          log_in(@user)
          redirect_to root_path, :notice => "Bienvenue #{@user.first_name} !"
        else
          render 'new'
        end
    
      end
    
      def edit
        @user = User.find(params[:id])
      end
    
      def update
        @user = User.find(params[:id])
        @user.password = @user.password
        user_params = params.permit(:first_name, :last_name, :age, :email, :description, :password)
        if @user.update(user_params) # essaie de sauvegarder en base @gossip
            flash[:notice] = "Profile successfully edited"
            redirect_to @user
        else
            render 'edit'
        end
    end
    
      def destroy
      end

end