require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/artist')
require_relative('./models/album')

#INDEX

get '/artists' do #when you get the url, do the following
  @artists = Artist.all()
  erb ( :index_artist )
end

get '/albums' do
  @albums = Album.all()
  erb ( :index_album )
end

#NEW

get '/artists/new' do
  erb ( :new_artist )
end

post '/artists' do
  @artist = Artist.new( params )
  @artist.save()
  erb( :create_artist )
end


get '/albums/new' do
  erb ( :new_album )
end

post '/albums' do
  @album = Album.new( params )
  @album.save()
  erb( :create_album )
end

#SHOW

get '/artists/:id' do
  @artist = Artist.find( params[:id] )
  erb( :show_artist )
end

#UPDATE

get '/artists/:id/edit' do
@artist = Artist.find( params[:id] )
erb ( :edit_artist )
end

post '/artists/:id' do
  Artist.update( params )
  redirect(to( "/artists/#{params[:id]}"))
  erb ( :show_artist )
end


#DESTROY

post '/artists/:id/delete' do
  Artist.destroy( params[:id] )
  redirect( to( '/artists' ) )
end