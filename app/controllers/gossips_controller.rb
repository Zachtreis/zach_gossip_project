class GossipsController < ApplicationController

    def index
        @gossips = Gossip.all
    end

    def show
        @gossips = Gossip.find(params[:id])
    end

    def new
        @gossip = Gossip.new
    end

    def create
        @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: 86)

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
        gossip_params = params.permit(:gossip).permit(:new_title, :new_content)
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

end