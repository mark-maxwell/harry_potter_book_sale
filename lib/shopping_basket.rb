class ShoppingBasket
	def initialize(books)
		@books = books
		@total = 0
	end

	def checkout
		count = 0
		discounted = []
		@books.uniq{ |u_book| u_book.id }.each do |book|
			@total += book.price
			count += 1
			puts "total is: " + @total.to_s
			puts "count is: " + count.to_s
		end
		if count == 1
			@total
		elsif count == 2
			@total = @total * 0.95
		end
	end

	def discount_set
		set_total = 0
		@books.each do |book|
				
		end
	end
end