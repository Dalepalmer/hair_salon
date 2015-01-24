require('sinatra')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require('./lib/client')
require('./lib/stylist')
require('pg')

DB = PG.connect({:dbname => "hair_salon"})

get("/") do
  @clients = Client.all()
  @stylists = Stylist.all()
  erb(:index)
end

post("/clients") do
  name = params.fetch("name")
  client_id = params.fetch("client_id").to_i()
  client = Client.new({:name => name, :client_id => client_id,})
  client.save()
  @stylist = Stylist.find(client_id)
  erb(:stylist)
end


post("/stylist") do
  name = params.fetch("name")
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  @stylists = Stylist.all()
  erb(:index)
end

delete("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:index)
end

get("/stylists/:id/edit") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist_edit)
end

patch("/stylists/:id") do
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name})
  erb(:list)
end

get("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end
