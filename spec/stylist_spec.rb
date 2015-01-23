require('spec_helper')

describe(Stylist) do

  describe(".all") do
    it("Tests to see if the Stylist class is empty") do
      expect(Stylist.all()).to(eq([]))
    end
  end
end
