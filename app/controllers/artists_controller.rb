class ArtistsController < ApplicationController

    get '/artists' do
        @type = "artist"
        @all = Artist.all
        erb :index
    end

    get '/artists/:slug' do
        @artist = Artist.find_by_slug(params[:slug])
        erb :'/artists/show'
    end
end
