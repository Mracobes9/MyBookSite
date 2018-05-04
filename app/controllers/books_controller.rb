class BooksController < ApplicationController
    def show
        @book = Book.find(params[:id])
        @comment = Comment.new
    end
end
