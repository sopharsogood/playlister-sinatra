class SongsController < ApplicationController

    get '/songs' do
        @type = "song"
        @all = Song.all
        erb :index
    end
    
end
