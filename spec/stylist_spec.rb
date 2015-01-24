require('spec_helper')

describe(Stylist) do

  describe(".all") do
    it("Tests to see if the Stylist class is empty") do
      expect(Stylist.all()).to(eq([]))
    end
  end


  describe("#save") do
    it("saves an stylist to the database") do
      test_stylist = Stylist.new({:name => "Shea", :id => nil})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe("#name") do
    it("Lists the name of a stylist inserted into the class") do
      test_stylist = Stylist.new({:name => "Lisa", :id => nil})
      expect(test_stylist.name()).to(eq("Lisa"))
    end
  end

  describe("#id") do
    it("Lists the id of a stylist inserted into the class") do
      test_stylist = Stylist.new({:name => "Lisa", :id => nil})
      test_stylist.save()
      expect(test_stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".find") do
    it("returns a client by its ID number") do
      test_stylist = Stylist.new({:name => "Matt", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Kaleb", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe("#clients") do
    it("returns an array of clients for that stylist") do
      test_stylist = Stylist.new(:name => "Sarah", :id => nil)
      test_stylist.save()
      test_client = Client.new(:name => "Joe", :client_id => test_stylist.id())
      test_client.save()
      test_client2 = Client.new(:name => "Mark", :client_id => test_stylist.id())
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end

describe("#delete") do
    it("lets you delete a list from the database") do
      stylist = Stylist.new({:name => "Brittany", :id => nil})
      stylist.save()
      stylist2 = Stylist.new({:name => "Mark", :id => nil})
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end
  end

  describe("#delete") do
    it("deletes a list's clients from the database") do
      stylist = Stylist.new({:name => "Brenda", :id => nil})
      stylist.save()
      client = Client.new({:name => "Frank", :client_id => stylist.id()})
      client.save()
      client2 = Client.new({:name => "Bill", :client_id => stylist.id()})
      client2.save()
      stylist.delete()
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#==') do
    it("checks if stylists are the same if they share a name") do
      stylist1 = Stylist.new({:name => "Mark", :client_id => 8, :id => nil})
      stylist2 = Stylist.new({:name => "Mark", :client_id => 8, :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end
end
