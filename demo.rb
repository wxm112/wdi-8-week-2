require "sinatra"
require 'sinatra/reloader'


get '/hello' do
	"Hello world from Sinatra" 	
end
get '/help' do 
	"Hello world"
end

get '/may' do
	"Hello May, have a nice day."
end

get '/greeting/:name' do
	"Hello " + params[:name]
end

get '/greeting/:first/:last' do
"Hello there Mr or Mr #{params[:first]} #{params[:last].upcase}"
end

get '/greeting/:first/:last/:age' do
	"#{params[:first]} is #{params[:age]} years old"
end

get '/multiply/:x/:y' do
	result = params[:x].to_f * params[:y].to_f
	"The result is #{result}"
end
