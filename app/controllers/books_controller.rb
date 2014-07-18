class BooksController < ApplicationController

  before_filter :get_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
    @chapters = @book.chapters
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_path(@book.id)
    else
      render action: :edit
    end
  end


  def update
    @book.assign_attributes(book_params)

    if @book.save
      redirect_to book_path(@book.id)
    else
      render action: :edit
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to books_path
  end

  def book_params
    params.require(:book).permit(:name, :description, :country, :author)
  end

  def get_book
    @book = Book.find(params[:id])
  end
end
