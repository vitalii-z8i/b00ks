class SearchesController < ApplicationController
  def search
    @book_results = []
    @chapter_results = []
    unless params[:search].nil?
      @book_results = Book.search(Riddle::Query.escape(params[:search]), field_weights: {name: 15, author: 14, description: 10})
      @chapter_results = Chapter.search(Riddle::Query.escape(params[:search]))

      @book_excerpter = ThinkingSphinx::Excerpter.new 'chapter_core', params[:search]
      @chapter_excerpter = ThinkingSphinx::Excerpter.new 'book_core', params[:search]
    end
  end
end