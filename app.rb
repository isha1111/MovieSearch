require 'sinatra'
require 'httparty'
require 'bcrypt'

require './db_config'
require './model/movie'
require './model/user'

enable :sessions

# loads the main page
get '/' do
	erb :index
end

# loads the page with the movie list matching search criteria
get "/movieDetails" do
	info = HTTParty.get("http://www.omdbapi.com/?s=#{params[:movie]}")
	@result = info['Search']
	erb :list
end

# shows movie details page
get '/display' do
	# if movie is already stored in databse fetches from database
	if Movie.where(imdb_id: params[:id]).first
		movie1 = Movie.where(imdb_id: params[:id]).first
		@title = movie1.name
		@year = movie1.year
		@director = movie1.director
		@actors = movie1.actors
		@image = movie1.image_url
	else
		# else movie details is showed and stored in database as well
		info = HTTParty.get("http://www.omdbapi.com?i=#{params[:id]}")
		@title = info["Title"]
		@year = info["Year"]
		@director = info["Director"]
		@actors = info["Actors"]
		@image = info["Poster"]
		movie1 = Movie.new
		movie1.name = info["Title"]
		movie1.image_url = info["Poster"]
		movie1.year = info["Year"]
		movie1.director = info["Director"]
		movie1.actors = info["Actors"]
		movie1.imdb_id = params[:id]
		movie1.save
		# saving info in DB
	end

	erb :about
end

# takes the user back to main page
# get '/index.erb' do
# 	erb :index
# end

# shows the history of movies searched by fetching the data saved in DB
get '/search-history' do
	erb :history
end

# shows movie details when a movie name is clicked by user from history
get '/movie' do
	movie1 = Movie.where(id: params[:id]).first
	@title = movie1.name
	@year = movie1.year
	@director = movie1.director
	@actors = movie1.actors
	@image = movie1.image_url
	erb:about
end

# stores data of new user
post '/user' do
	erb :index
end
