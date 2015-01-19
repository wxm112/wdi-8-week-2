require 'sinatra'
require 'sinatra/reloader'
require 'yahoofinance'

get '/get' do
  if params[:symbol]
    @symbol = params[:symbol].upcase
    @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].lastTrade
  end
  erb :lookup
end
