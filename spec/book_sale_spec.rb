require 'book'

RSpec.describe "books" do
	it "can create a new book" do
		a_book = Book.new("Prisoner of Azkaban", 8.00)
		expect( a_book ).not_to be_nil
	end
end