class ShoppingBasket
	def initialize(books)
		@books = books
		@total = 0
	end

	def checkout
		count = 0
		discounted = []
		puts "books array before loop: " + @books.to_s
		@books.uniq{ |u_book| u_book.id }.each do |book|
			@total += book.price
			count += 1
			puts "total is: " + @total.to_s
			puts "count is: " + count.to_s
			@books.delete_at(@books.index(book))
			puts "books array after: " + @books.to_s
		end

		if !@books.empty?
			checkout
		else
			if count == 1
			@total
			elsif count == 2
			@total = @total * 0.95
			end
		end
	end

	def discount_set
		set_total = 0
		@books.each do |book|
				
		end
	end
end