class SongsController < ApplicationController

    get '/songs' do
        @type = "song"
        @all = Song.all
        erb :index
    end

    get '/songs/new' do
        @genres = Genre.all
        erb :'/songs/new'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    post '/songs/new' do
        @new_song_hash = params[:song]
        @artist = Artist.find_or_create_by(name: params[:artist_name])
        @new_song_hash[:artist_id] = @artist.id
        @new_song_hash[:genre_ids] = [] if !@new_song_hash[:genre_ids]
        if params[:new_genre_name] != ""
            @new_song_hash[:genre_ids] << Genre.create(name: params[:new_genre_name]).id
        end
        @new_song = Song.new(@new_song_hash)
        @new_song.save
        flash[:message] = "Successfully created song."
        redirect '/songs/' + @new_song.slug
    end 

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        erb :'/songs/edit'
    end

    patch '/songs/:slug' do
        @song_hash = params[:song]
        @artist = Artist.find_or_create_by(name: params[:artist_name])
        @song_hash[:artist_id] = @artist.id
        @song = Song.find_by_slug(params[:slug])
        @song.update(@song_hash)
        flash[:message] = "Successfully updated song."
        redirect '/songs/' + params[:slug]
    end

end
