require 'sinatra'
require 'httparty'
require './db_config'
require './model/movie'
require "sinatra/reloader"

get '/' do
	erb :index
end

get "/movieDetails" do

	info = HTTParty.get("http://www.omdbapi.com/?s=#{params[:movie]}")
	# if info["Title"] == params[:movie]
	# 	@title = info["Title"]
	# 	@year = info["Year"]
	# 	@director = info["Director"]
	# 	@actors = info["Actors"]
	# 	@image = info["er"]
	# 	erb :about
	# else
	@result = info['Search']

	# return params[:movie]
	erb :list
	# end
end

get '/display' do

	if Movie.where(imdb_id: params[:id]).first
		movie1 = Movie.where(imdb_id: params[:id]).first
		@title = movie1.name
		@year = movie1.year
		@director = movie1.director
		@actors = movie1.actors
		@image = movie1.image_url
	else
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
	end
	erb :about
end

get '/index.erb' do
	erb :index
end
