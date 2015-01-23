require('spec_helper')

describe(Client) do

  describe(".all") do
    it("Tests to see if the Client class is empty") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves an client to the database") do
      test_client = Client.new({:name => "Katie", :id => nil})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe("#name") do
    it("clients the name of a client inserted into the class") do
      test_client = Client.new({:name => "Margaret", :id => nil})
      expect(test_client.name()).to(eq("Margaret"))
    end
  end
  describe("#id") do
    it("clients the id of a client inserted into the class") do
      test_client = Client.new({:name => "Margaret", :id => nil})
      test_client.save()
      expect(test_client.id()).to(be_an_instance_of(Fixnum))
    end
  end

   describe(".find") do
    it("returns a client by its ID number") do
      test_client = Client.new({:name => "Matt", :id => nil})
      test_client.save()
      test_client2 = Client.new({:name => "Kaleb", :id => nil})
      test_client2.save()
      expect(Client.find(test_client2.id())).to(eq(test_client2))
    end
  end

  describe('#==') do
    it("checks if clients are the same if they share a name") do
      client1 = Client.new({:name => "Jessie", :id => nil})
      client2 = Client.new({:name => "Jessie", :id => nil})
      expect(client1).to(eq(client2))
    end
  end
end
