class LikesController < ApplicationController
    before_action :authenticate_user, only: [:new, :create, :destroy]

    def new
    end

    def create
        @like = Like.new(user_id: current_user.id, gossip_id: params[:gossip_id])

        @like.save # essaie de sauvegarder en base @gossip
        redirect_to gossip_path(params[:gossip_id])
    end 

    def destroy
        @like = Like.find(params[:id])
        @like.destroy
        redirect_to gossip_path(params[:gossip_id])
    end

    private

    
    
    def authenticate_user
      unless current_user
        flash[:danger] = "Please log in."
        redirect_to new_session_path
      end
    end
    

end