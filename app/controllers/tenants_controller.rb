class TenantsController < ApplicationController
  set :views, "app/views/tenants/"


  
  #see index of all tenants
  get '/tenants' do
    @tenants = Tenant.all
    erb :index
  end

  
  #GET: create new tenant page
  get '/tenants/new' do 
    @apartments = Apartment.all
    erb :new
  end

  post '/tenants' do
    new_tenant = Tenant.create(name: params[:name])
    if params[:existing_apt_id]
      new_tenant.update(apartment_id: params[:existing_apt_id])
    else
      apt = Apartment.create(address: params[:new_address])
      new_tenant.update(apartment_id: apt.id)
    end
    redirect "/tenants/#{new_tenant.id}"
  end

 


  #GET: view one particular tenant
  get '/tenants/:id' do
    @tenant = current_tenant
    erb :show
  end

  #GET: edit tenant page
  get '/tenants/:id/edit' do
    @tenant = current_tenant
    @apartments = Apartment.all
    erb :edit
  end
  
  #PATCH: edit tenant
  patch '/tenants/:id' do
    #binding.pry
    @tenant = current_tenant
    if params[:existing_apt_id]
      @tenant.update(apartment_id: params[:existing_apt_id])
    else
      apt = Apartment.create(address: params[:new_address])
      @tenant.update(apartment_id: apt.id)
    end
    redirect "/tenants/#{@tenant.id}"
  end

  

  #DELETE: delete tenant
  delete '/tenants/:id' do
    tenant = current_tenant
    tenant.destroy
    redirect '/tenants'
  end

  def current_tenant
    Tenant.find(params[:id])
  end

end
