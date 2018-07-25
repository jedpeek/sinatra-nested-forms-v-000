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
      @pirate = Pirate.new(params[:pirate])
      params[:pirate][:ships].each do |ship_data|
        ship = Ship.new(ship_data)
        ship.pirate = pirate
        ship.save
      end
      @ships = Ship.all
      binding.pry
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
