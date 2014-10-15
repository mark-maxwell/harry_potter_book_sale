require 'book'
require 'shopping_basket'

RSpec.describe "books" do
	it "can create a new book" do
		a_book = Book.new("Prisoner of Azkaban", 8.00, 3)
		expect(a_book ).not_to be_nil
	end

	it "can return book author, title and id" do
		a_book = Book.new("Prisoner of Azkaban", 8.00, 3)

		expect(a_book.title).to eq("Prisoner of Azkaban")
		expect(a_book.price).to eq(8.00)
		expect(a_book.id).to eq(3)
	end
end

describe "shopping basket" do
	it "can create a new shopping basket" do
		a_book = Book.new("Philosopher's Stone", 8.00, 1)
		another_book = Book.new("Chamber of Secrets", 8.00, 2)
		a_shopping_basket = ShoppingBasket.new([a_book, another_book])
		expect(a_shopping_basket).not_to be_nil
	end

	it "can apply a 5% discount when 2 different books purchased" do
		a_book = Book.new("Philosopher's Stone", 8.00, 1)
		another_book = Book.new("Chamber of Secrets", 8.00, 2)
		a_shopping_basket = ShoppingBasket.new([a_book, another_book])
		expect(a_shopping_basket.checkout).to eq(15.20)
	end

	it "can apply no discount if books are the same" do
		a_book = Book.new("Philosopher's Stone", 8.00, 1)
		a_shopping_basket = ShoppingBasket.new([a_book, a_book])
		expect(a_shopping_basket.checkout).to eq(16.00)
	end

	it "can exclude duplicates being included in discounts" do
		a_book = Book.new("Philosopher's Stone", 8.00, 1)
		another_book = Book.new("Chamber of Secrets", 8.00, 2)

		a_shopping_basket = ShoppingBasket.new([a_book, another_book, a_book])
		expect(a_shopping_basket.checkout).to eq(23.20)
	end

	it "can apply discounts of 5%, 10%, 20% and 25% for 2, 3, 4 or 5 unique books purchased respectively" do
		a_book = Book.new("Philosopher's Stone", 8.00, 1)
		another_book = Book.new("Chamber of Secrets", 8.00, 2)
		another_book2 = Book.new("Prisoner of Azkaban", 8.00, 3)
		another_book3 = Book.new("Goblet of Fire", 8.00, 4)
		another_book4 = Book.new("Deathly Hallows", 8.00, 5)

		# apply 5% discount for 2 unique books
		a_shopping_basket2 = ShoppingBasket.new([a_book, another_book])
		expect(a_shopping_basket2.checkout).to eq(15.2)

		# apply 10% discount for 3 unique books
		a_shopping_basket3 = ShoppingBasket.new([a_book, another_book, another_book2])
		expect(a_shopping_basket3.checkout).to eq(21.6)

		# apply 20% discount for 4 unique books
		a_shopping_basket4 = ShoppingBasket.new([a_book, another_book, another_book2, another_book3])
		expect(a_shopping_basket4.checkout).to eq(25.6)

		# apply 25% discount for 5 unique books purchased
		a_shopping_basket5 = ShoppingBasket.new([a_book, another_book, another_book2, another_book3, another_book4])
		expect(a_shopping_basket5.checkout).to eq(30)
	end












end