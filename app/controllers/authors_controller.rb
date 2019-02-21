class AuthorsController < ApplicationController

    def show
        @user = User.find(params[:id])
        @gossips =[]
        gossip = Gossip.all
        gossip.each do |gossip|
            if gossip.user.last_name == @user.last_name
                @gossips << gossip
            end
        end
    end

end