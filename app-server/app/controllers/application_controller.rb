require 'net/http'
require 'open-uri'
require 'json'
require 'awesome_print'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  post '/drinks' do
    drink = Drink.create(name: params[:name], instructions: params[:instructions])
    drink.to_json
  end

  get '/drinks' do
    drinks = Drink.all
    drinks.to_json
  end

  patch '/drinks/:id' do
    drink = Drink.find(params[:id])
    drink.update(
      name: params[:name],
      instructions: params[:instructions],
      ingredients: params[:ingredients]
    )
    drink.to_json
  end

  delete "/drinks/:id" do
    drink = Drink.find(params[:id])
    drink.destroy
    drink.to_json
  end

  get '/mixologists' do
    mixologists = Mixologist.all
    mixologists.to_json
  end

  # get '/mixologists' do
  #   mixologists = Mixologist.all.includes(:drinks)
  #   mixologists.to_json
  # end

  post '/mixologists' do
    mixologist = Mixologist.create(name: params[:name])
    mixologist.to_json
  end

end
