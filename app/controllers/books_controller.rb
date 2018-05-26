class BooksController < ApplicationController
    before_action :authenticate_user!, only:[:show,:new, :create]
    before_action :admin_check, only:[:new, :create]
    def show
        @book = Book.find(params[:id])
        @comment = @book.comments.new
    end
    def new
        @book = Book.new
        @authors = Author.all.map {|author| [author.getFioAuthor,author.id]}
    end
    def create
        #byebug
        @book = Book.new(book_params)
        render action: :new unless @book.save
        redirect_back book_url(@book)
    end
    private

    def book_params
        params.require(:book).permit(:name,:author_id, :book_cover, :description)
    end
    def admin_check
        redirect_to root_url if current_user.admin
    end

end
