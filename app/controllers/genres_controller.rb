class GenresController < ApplicationController

    get '/genres' do
        @type = "genre"
        @all = Genre.all
        erb :index
    end
    
end
