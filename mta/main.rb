require 'sinatra'
require 'sinatra/reloader'
require 'pry'

LINES = { 'line_n' => ['times square', '34th', '28th', '23rd','union square', '8th'], 
        'line_l' => ['8th', '6th', 'union square', '3rd', '1st'], 
        'line_6' => ['grand central', '33rd', '28th', '23rd', 'union square', 'astor place'] }


get '/' do

 erb :home
end


get '/result' do 
    @start_line = params['start_line']
    @start_station = params[:start_station]
    @destination_line = params[:destination_line]
    @destination_station = params[:destination_station]
    if @start_line == @destination_line
        line = LINES[@start_line.downcase]

    if line.nil?
      # puts "There is no such line: #{start_line}"
      @stations = nil
    else
      s_index = line.index(@start_station)
      d_index = line.index(@destination_station)
      if s_index < d_index
        @stations = line[s_index..d_index]
        @stations_num = @stations.count
      else
        @stations = line[d_index..s_index].reverse
        @stations_num = @stations.count
      end
    end
    # If the start and ending stations aren't in the same line.
  else
    s_line = LINES[@start_line.downcase]
    d_line = LINES[@destination_line.downcase]
    if s_line.nil? || d_line.nil?
      # puts "There is no such line: #{start[0]}"
      @stations = nil
    else
      s_index = s_line.index(@start_station)
      u_s_index = s_line.index('union square')
      u_d_index = d_line.index('union square')
      d_index = d_line.index(@destination_station)
      if s_index < u_s_index
        f_stations = s_line[s_index..u_s_index]
      else
        f_stations = s_line[u_s_index..s_index].reverse
      end
      if u_d_index < d_index
        l_stations = d_line[u_d_index..d_index]
      else
        l_stations = d_line[d_index..u_d_index].reverse
      end
      @stations = (f_stations - ['union square'] + l_stations)
      @stations_num = @stations.count
    end
  end
    erb :result
end