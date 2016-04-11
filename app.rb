require 'sinatra'
require 'httparty'

get '/' do 
	erb :index	
end

get '/movieDetails' do
	info = HTTParty.get("http://www.omdbapi.com/?s=#{params[:movie]}")
	# if info["Title"] == params[:movie]
	# 	@title = info["Title"]
	# 	@year = info["Year"]
	# 	@director = info["Director"]
	# 	@actors = info["Actors"]
	# 	@image = info["Poster"]
	# 	erb :about
	# else
	@result = info['Search']
	@result.inspect
	erb :list
	# end
end

get '/display' do

	info = HTTParty.get("http://www.omdbapi.com?i=#{params[:id]}")
	@title = info["Title"]
	@year = info["Year"]
	@director = info["Director"]
	@actors = info["Actors"]
	@image = info["Poster"]
	erb :about
end

get '/index.erb' do
	erb :index
end