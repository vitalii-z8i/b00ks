class SearchesController < ApplicationController
  def search
    @book_results = []
    @chapter_results = []
    @book_results = Book.search do 
      keywords params[:search] do
        highlight :name
        highlight :author
        highlight :description
      end
    end
    @chapter_results = Chapter.search do
      keywords params[:search] do
        highlight :inner_text
      end
    end
  end
end