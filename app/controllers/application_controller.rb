class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "7d883b863106ab45c16577c285f7d8c79793238cab439eacec2ca4ae6472736baeb35303a26efb4e5cc97b09e9f54db9e8bed22ab34d5810bc11362b8031e7a2"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end
end