require 'book'
require 'shopping_basket'

RSpec.describe "books" do
	it "can create a new book" do
		a_book = Book.new("Prisoner of Azkaban", 8.00, 3)
		expect( a_book ).not_to be_nil
	end

	it "can return book author, title and id" do
		a_book = Book.new("Prisoner of Azkaban", 8.00, 3)

		expect( a_book.title).to eq("Prisoner of Azkaban")
		expect( a_book.price).to eq(8.00)
		expect( a_book.id).to eq(3)
	end
end

describe "shopping basket" do
	it "can create a new shopping basket" do
		a_book = Book.new("Philosopher's Stone", 8.00, 1)
		another_book = Book.new("Chamber of Secrets", 8.00, 2)
		a_shopping_basket = ShoppingBasket.new([a_book, another_book])
		expect( a_shopping_basket).not_to be_nil
	end

	it "can apply a 5% discount when 2 different books purchased" do
		a_book = Book.new("Philosopher's Stone", 8.00, 1)
		another_book = Book.new("Chamber of Secrets", 8.00, 2)
		a_shopping_basket = ShoppingBasket.new([a_book, another_book])
		expect( a_shopping_basket.checkout).to eq(15.20)
	end

	it "can apply no discount if books are the same" do
		a_book = Book.new("Philosopher's Stone", 8.00, 1)
		a_shopping_basket = ShoppingBasket.new([a_book, a_book])
		expect( a_shopping_basket.checkout).to eq(16.00)
	end
end