require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do 
        erb :'../views/super_hero'
    end 

    post '/teams' do 
        @team_name = params[:team][:name]
        @team_motto = params[:team][:motto]
        members = params[:team][:heroes]
        @heroes = members.collect do |member|
            Hero.new({name: member[:name], power: member[:power], bio: member[:bio]})
        end
        erb :team
    end


end
