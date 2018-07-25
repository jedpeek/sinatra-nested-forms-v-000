require './environment'

module FormsLab
  class App < Sinatra::Base

    #STATIC URLS

    get '/pirates' do
      @pirates = Pirate.all
      erb :'pirates/index'
    end

    get '/pirates/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      binding.pry
      @pirate = Pirate.new(params[:pirate])
      @ships = params[:pirate][:ships].each do |ship|
        Ship.new(ship)
      erb :'pirates/show'
    end

    get 'pirates/show' do
      erb :'/pirates/show'
    end

    #DYNAMIC URLS

    get '/pirates/:id' do
      @pirate = Pirate.find(params[:id])
      erb :'pirates/show'
    end
  end
end
