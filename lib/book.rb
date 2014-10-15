class Book
	attr_accessor :title, :price, :id
	
	def initialize(title, price, id)
		@title = title
		@price = price
		@id = id
	end
end