class Stylist
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM expenses;")
    stylists = []
    returned_stylists.each() do |stylist|
      name = stylist.fetch("name")
      id = expense.fetch("id").to_i()
end
