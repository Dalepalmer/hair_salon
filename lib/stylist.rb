class Stylist
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      name = stylist.fetch("name")
      id = stylist.fetch("id").to_i()
      stylists.push(Stylist.new({:name => name, :id => id}))
    end
    stylists
  end


  define_singleton_method(:find) do |id|
    found_stylist = nil
    Stylist.all().each() do |stylist|
      if stylist.id().==(id)
        found_stylist = stylist
      end
    end
    found_stylist
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_stylist|
    self.name().eql?(another_stylist.name()).&(self.id().eql?(another_stylist.id()))
  end

  define_method(:clients) do
    stylist_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE client_id =#{self.id()};")
      stylist_clients.each() do |client|
      name = client.fetch("name")
      client_id = client.fetch("client_id")
      stylist_clients.push(Client.new(:name => name, :client_id => client_id))
    end
    stylist_clients
  end
end
