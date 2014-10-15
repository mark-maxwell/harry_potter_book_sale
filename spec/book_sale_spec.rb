require 'book'
require 'shopping_basket'

RSpec.describe "books" do
	it "can create a new book" do
		a_book = Book.new("Prisoner of Azkaban", 8.00)
		expect( a_book ).not_to be_nil
	end

	it "can return book author and title" do
		a_book = Book.new("Prisoner of Azkaban", 8.00)

		expect( a_book.title).to eq("Prisoner of Azkaban")
		expect( a_book.price).to eq(8.00)
	end
end

describe "shopping basket" do
	it "can create a new shopping basket" do
		a_book = Book.new("Philosopher's Stone", 8.00)
		another_book = Book.new("Chamber of Secrets", 8.00)
		a_shopping_basket = ShoppingBasket.new([a_book, another_book])
		expect( a_shopping_basket).not_to be_nil
	end

	it "can checkout and return total price" do
		a_book = Book.new("Philosopher's Stone", 8.00)
		another_book = Book.new("Chamber of Secrets", 8.00)
		a_shopping_basket = ShoppingBasket.new([a_book, another_book])
		expect( a_shopping_basket.checkout).to eq(16.00)
	end
end