class ShoppingBasket
	def initialize(books)
		@books = books
		@total = 0
	end

	def checkout
		count = 0
		sets = 0
		discounted = []
		puts "books array before loop: " + @books.to_s
		@books.uniq{ |u_book| u_book.id }.each do |book|
			count += 1
			puts "count is: " + count.to_s
			@books.delete_at(@books.index(book))
			puts "books array after: " + @books.to_s
		end

		sets += 1
		puts "sets : " + sets.to_s
		discount_set(count)

		if !@books.empty?
			checkout
		else
			puts "total at end is: " + @total.to_s
			@total
		end
	end

	def discount_set(num)
		if num == 1
			@total += 8.00
		elsif num == 2
			@total += (16 * 0.95)
		elsif num == 3
			@total += (24 * 0.90)
		elsif num == 4 
			@total += (32 * 0.80)
		else
			@total += (40 * 0.75)
				
		end
	end
end