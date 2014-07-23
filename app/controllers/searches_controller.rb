class SearchesController < ApplicationController
  def search
    @book_results = []
    @chapter_results = []
    unless params[:search].nil?
      @book_results = Book.where(id: $xap_books.search(params[:search]).map {|r| r.id})
      @chapter_results = Chapter.where(id: $xap_chapter.search(params[:search]).map {|r| r.id})
    end
  end
end