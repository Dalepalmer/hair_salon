require('spec_helper')

describe(Client) do

  describe(".all") do
    it("Tests to see if the Client class is empty") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves an client to the database") do
      test_client = Client.new({:name => "Katie", :client_id => 4})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe("#name") do
    it("clients the name of a client inserted into the class") do
      test_client = Client.new({:name => "Margaret", :client_id => 3})
      expect(test_client.name()).to(eq("Margaret"))
    end
  end

  describe("#client_id") do
    it("lists the clients id") do
      test_client = Client.new({:name => "Bob", :client_id => 14})
      expect(test_client.client_id()).to(eq(14))
    end
  end

  describe('#==') do
    it("checks if clients are the same if they share a name") do
      client1 = Client.new({:name => "Jessie", :client_id => 6})
      client2 = Client.new({:name => "Jessie", :client_id => 6})
      expect(client1).to(eq(client2))
    end
  end
end
