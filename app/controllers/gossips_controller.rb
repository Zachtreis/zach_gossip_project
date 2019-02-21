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
        @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: session[:user_id])

        if @gossip.save # essaie de sauvegarder en base @gossip
            redirect_to root_path, :notice => "Potin cree !"
        else
            render 'new', :notice => "Ca marche pas !"
        end
    end

    def update
    end

    def destroy
    end

end