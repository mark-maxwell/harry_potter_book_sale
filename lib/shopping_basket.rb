class ShoppingBasket
	def initialize(books)
		@books = books
		@total = 0
		@sets_to_discount = []
	end

	def checkout
		count = 0
		sets = 0
		discounted = []
		#puts "books array before loop: " + @books.to_s
		@books.uniq{ |u_book| u_book.id }.each do |book|
			count += 1
			#puts "count is: " + count.to_s
			@books.delete_at(@books.index(book))
			#puts "books array after: " + @books.to_s
		end
		@sets_to_discount << count
		#puts "sets to discount is: " + @sets_to_discount.to_s
		#discount_set(count)

		if !@books.empty?
			checkout
		else
			#puts "total at end is: " + @total.to_s
			discount_sets
			@total
		end
	end

	def discount_sets
		if @sets_to_discount.include?(5) && @sets_to_discount.include?(3)
			@sets_to_discount.delete_at(@sets_to_discount.index(5))
			@sets_to_discount.delete_at(@sets_to_discount.index(3))
			@sets_to_discount << 4 << 4
			discount_sets
		else
			@sets_to_discount.each do |set|
				discount_set(set)
			end
		end

	end

	# unused method that was called above (comment out as well) before discount_sets existed
	def discount_set(books_in_set)
		@total += 8.00 if books_in_set == 1
		@total += (16 * 0.95) if books_in_set == 2
		@total += (24 * 0.90) if books_in_set == 3
		@total += (32 * 0.80) if books_in_set == 4
		@total += (40 * 0.75) if books_in_set == 5
	end
end