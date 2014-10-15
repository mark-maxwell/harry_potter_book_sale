class ShoppingBasket
	def initialize(books)
		@books = books
		@total = 0
	end

	def checkout
		@books.each do |book|
			@total += book.price
		end
		@total
	end
end