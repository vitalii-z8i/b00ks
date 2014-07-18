class ChaptersController < ApplicationController

  before_filter :get_book
  before_filter :get_chapter, only: [:show, :edit, :update, :destroy]

  def new
    @chapter = Chapter.new
  end

  def create
    @chapter = @book.chapters.build(chapter_params)

    if @chapter.save
      redirect_to book_chapter_path(@book, @chapter)
    else
      render action: :edit
    end
  end

  def update
    @chapter.assign_attributes(chapter_params)

    if @chapter.save
      redirect_to book_chapter_path(@book, @chapter)
    else
      render action: :edit
    end
  end

  def destroy
    @chapter.destroy
    redirect_to book_chapters_path(@book)
  end

  def chapter_params
    params.require(:chapter).permit(:number, :book_id, :inner_text)
  end

  def get_book
    @book = Book.find(params[:book_id]) if @book.nil?
  end

  def get_chapter
    @chapter = @book.chapters.find(params[:id])
  end
end
