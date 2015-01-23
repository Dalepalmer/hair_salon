require('spec_helper')

describe(Client) do

  describe(".all") do
    it("Tests to see if the Client class is empty") do
      expect(Client.all()).to(eq([]))
    end
  end
end
