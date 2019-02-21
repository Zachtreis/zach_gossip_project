class GossipsController < ActionController::Base

    def index
        @gossips = Gossip.all
    end

    def show
        @gossips = Gossip.find(params[:id])
    end
end