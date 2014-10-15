require 'book'

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