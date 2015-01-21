require 'sinatra'
require 'sinatra/reloader'


# The @ is very importent, you cannot access rb vairalbe without @ in erb document.


get '/' do 
    @groucho = 'excellent'
    @kitten = "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTOwikoa5KykmLDEQSmnxLdzRw8ZWccmVN-eB-Q_hafCddL0s6y"
    @debug_mode = params[:debug]
    erb :demo
end