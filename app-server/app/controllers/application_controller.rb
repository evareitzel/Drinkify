require 'net/http'
require 'open-uri'
require 'json'
require 'awesome_print'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/mixologists' do
    mixologists = Mixologist.all
    mixologists.to_json
  end

  get '/mixologists/:id' do
    mixologist = Mixologist.find(params[:id])
    mixologist.to_json(include: :drinks)
  end

  # get this working
  # ref: https://github.com/learn-co-students/SENG-LIVE-071921/blob/main/phase-3/09_sinatra_api_crud_and_relationships/README.md
  # get '/mixologists/:id'
  #   setMixologists(mixologists.map(m => m.id === mixologist.id ? mixologist : m))
  # end

  post '/mixologists' do
    mixologist = Mixologist.create(name: params[:name])
    mixologist.to_json
  end

  # ## get has_many/belongs_to data
  # get '/mixologist/drinks' do
  # end

  # get '/drinks' do
  #   drinks = Drink.all
  #   drinks.to_json
  # end

  # most recent 5
  get '/drinks' do
    drinks = Drink.all.limit(5) # .order(:updated_at) / (:created_at) - before .limit
    drinks.to_json
  end

  post '/drinks' do
    drink = Drink.create(name: params[:name], instructions: params[:instructions])
    drink.to_json
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

end
