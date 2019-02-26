class CitiesController < ApplicationController

    def show
        @cities = City.all
        @city = City.find(params[:id])
        @gossips = []
        @city.users.each do |user|
            user.gossips.each do |gossip|
                @gossips << gossip
            end
        end
    end
end
