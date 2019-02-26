class GossipsController < ApplicationController
    before_action :authenticate_user, only: [:new]
    before_action :author_gossip, only: [:edit, :update, :destroy]
  
    def index
        @gossips = Gossip.all
    end

    def show
        @gossip = Gossip.find(params[:id])
        @user = @gossip.user
        @comments = @gossip.comments
        @comment = Comment.new
        @like = Like.new
        @tag = Tag.new
    end

    def new
        @gossip = Gossip.new
        @tag = Tag.new
        @tags = Tag.all
    end

    def create
        @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: current_user.id)
        # @gossip = Gossip.new(gossip_params) 

        if @gossip.save # essaie de sauvegarder en base @gossip
            flash[:notice] = "Post successfully created"
            redirect_to root_path
        else
            render 'new'
        end
    end

    def edit 
        @gossip = Gossip.find(params[:id])
    end

    def update
        @gossip = Gossip.find(params[:id])
        gossip_params = params.permit(:title, :content)
        if @gossip.update(gossip_params) # essaie de sauvegarder en base @gossip
            flash[:notice] = "Post successfully edited"
            redirect_to @gossip
        else
            render 'edit'
        end
    end

    def destroy
        @gossip = Gossip.find(params[:id])
        if @gossip.destroy
            flash[:notice] = "Post successfully deleted"
            redirect_to root_path
        else
            redirect_to @gossip
        end

    end

    # def gossip_params
    #     params.permit(:title, :content, :user_id, :tag)
    #   end

    def authenticate_user
        unless current_user
            flash[:danger] = "Connecte-toi ;)"
            redirect_to new_session_path
        end
    end

    def author_gossip
        @gossip = Gossip.find(params[:id])
        unless current_user == @gossip.user || session[:user_id] == 91 # Zacharie
            flash[:danger] = "Tu n'es pas l'auteur de ce potin."
            redirect_to gossip_path(params[:id])
        end
    end
    

end