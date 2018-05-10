class BooksController < ApplicationController
    def show
        @book = Book.find(params[:id])
        @comment = Comment.new
    end
    def new
        @book = Book.new
        
        @authors = Author.all.map {|author| ["#{author.second_name} #{author.name[0]}.",author.id]}
    end
    def create
        #byebug
        @book = Book.new(book_params)
        render action: :new unless @book.save
        redirect_back fallback_location: root_url
    end
    private

    def book_params
        params.require(:book).permit(:name,:author_id, :book_cover, :description)
    end
end
