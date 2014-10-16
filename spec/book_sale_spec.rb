require 'book'
require 'shopping_basket'

describe "book sale" do
  before :all do
    @a_book = Book.new("Philosopher's Stone", 8.00, 1)
    @another_book = Book.new("Chamber of Secrets", 8.00, 2)
    @another_book2 = Book.new("Prisoner of Azkaban", 8.00, 3)
    @another_book3 = Book.new("Goblet of Fire", 8.00, 4)
    @another_book4 = Book.new("Deathly Hallows", 8.00, 5)
  end

  describe "books" do
    it "can create a new book" do
      expect(@a_book).not_to be_nil
    end

    it "can return book author, title and id" do
      expect(@another_book2.title).to eq("Prisoner of Azkaban")
      expect(@another_book2.price).to eq(8.00)
      expect(@another_book2.id).to eq(3)
    end
  end

  describe "shopping basket" do
    it "can create a new shopping basket" do
      a_shopping_basket = ShoppingBasket.new([@a_book, @another_book])
      expect(a_shopping_basket).not_to be_nil
    end

    it "can apply a 5% discount when 2 different books purchased" do
      a_shopping_basket = ShoppingBasket.new([@a_book, @another_book])
      expect(a_shopping_basket.checkout).to eq(15.20)
    end

    it "can apply no discount if books are the same" do
      a_shopping_basket = ShoppingBasket.new([@a_book, @a_book])
      expect(a_shopping_basket.checkout).to eq(16.00)
    end

    it "can exclude duplicates being included in discounts" do
      a_shopping_basket = ShoppingBasket.new([@a_book, @another_book, @a_book])
      expect(a_shopping_basket.checkout).to eq(23.20)

      a_shopping_basket2 = ShoppingBasket.new([@a_book, @another_book, @another_book, @another_book2])
      expect(a_shopping_basket2.checkout).to eq(29.6)
    end

    it "can apply discounts of 5%, 10%, 20% and 25% for 2, 3, 4 or 5 unique books purchased respectively" do
      # apply 5% discount for 2 unique books
      a_shopping_basket2 = ShoppingBasket.new([@a_book, @another_book])
      expect(a_shopping_basket2.checkout).to eq(15.2)

      # apply 10% discount for 3 unique books
      a_shopping_basket3 = ShoppingBasket.new([@a_book, @another_book, @another_book2])
      expect(a_shopping_basket3.checkout).to eq(21.6)

      # apply 20% discount for 4 unique books
      a_shopping_basket4 = ShoppingBasket.new([@a_book, @another_book, @another_book2, @another_book3])
      expect(a_shopping_basket4.checkout).to eq(25.6)

      # apply 25% discount for 5 unique books purchased
      a_shopping_basket5 = ShoppingBasket.new([@a_book, @another_book, @another_book2, @another_book3, @another_book4])
      expect(a_shopping_basket5.checkout).to eq(30)
    end

    it "can apply multiple discounts" do
      # 2x book1, 2x book2, 2x book3, 1x book4, 1x book5 has a discount for the set of 5 and a discount for
      # remaining set of 3
      a_shopping_basket = ShoppingBasket.new([@a_book, @another_book, @another_book2, @another_book3, 
        @another_book4, @a_book, @another_book, @another_book2])
      expect(a_shopping_basket.checkout).to eq(51.20)
    end

  end







end 