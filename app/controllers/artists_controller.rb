class ArtistsController < ApplicationController

    get '/artists' do
        @type = "artist"
        @all = Artist.all
        erb :index
    end
    
end
