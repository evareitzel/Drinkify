require 'net/http'
require 'open-uri'
require 'json'
require 'awesome_print'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/mixologists' do
    mixologists = Mixologist.all
    mixologists.to_json(include: :drinks)
  end

  post '/mixologists' do
    mixologist = Mixologist.create(
      name: params[:name],
    )
    mixologist.to_json
  end

  get '/drinks' do
    drinks = Drink.all.order(:created_at).reverse_order.limit(5)
    drinks.to_json
  end

  post '/drinks' do
    drink = Drink.create(
      name: params[:name],
      ingredients: params[:ingredients],
      instructions: params[:instructions],
      mixologist_id: params[:mixologist_id],
    )
    drink.to_json
  end

  patch '/drinks/:id' do
    drink = Drink.find(params[:id])
    drink.update(
      name: params[:name],
      ingredients: params[:ingredients],
      instructions: params[:instructions]
    )
    drink.to_json
  end

  delete "/drinks/:id" do
    drink = Drink.find(params[:id])
    drink.destroy
    drink.to_json
  end

end
