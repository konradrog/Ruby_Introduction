class Book
  attr_accessor :title, :author, :pub_date, :borrowed, :book_id
  def initialize(title, author, pub_date, book_id)
    @title = title
    @author = author
    @pub_date = pub_date
    @book_id = book_id
    @borrowed = false
  end
end
