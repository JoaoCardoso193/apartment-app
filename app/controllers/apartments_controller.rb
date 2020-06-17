class ApartmentsController < ApplicationController

  set :views, "app/views/apartments/"

  # add controller methods
  get '/apartments' do
    @apartments = Apartment.all
    
    erb :index
  end

  get '/apartments/new' do 
    erb :new
  end

  get '/apartments/:id' do
    @apartment = current_apartment
    erb :show
  end

  post '/apartments' do
    Apartment.create(address: params[:address])
    redirect '/apartments'
  end

  delete '/apartments/:id' do
    apt = current_apartment
    apt.destroy
    redirect '/apartments'
  end

  def current_apartment
    Apartment.find(params[:id])
  end
end
