class Client
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      name = client.fetch("name")
      id = client.fetch("id").to_i()
      clients.push(Client.new({:name => name, :id => id}))
    end
    clients
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:find) do |search_id|
    clients = DB.exec("SELECT * from clients;")
    found_client = nil
    clients.each() do |client|
      name = client.fetch("name")
      id = client.fetch("id").to_i
      if search_id.eql?(id)
        found_client = Client.new({:name => name, :id => id})
      end
    end
    found_client
  end

  define_method(:==) do |another_client|
    self.name().eql?(another_client.name()).&(self.id().eql?(another_client.id()))
  end

  define_method(:stylists) do
    client_stylists =  []
    tasks = DB.exec("SELECT * FROM stylists WHERE id = #{self.id()};")

    stylists.each() do |stylist|
      name = stylist.fetch("name")
      id = stylist.fetch("id").to_i()
      client_stylists.push(Stylist.new(:name => name, :id => id))
    end
    client_stylists
  end
end
