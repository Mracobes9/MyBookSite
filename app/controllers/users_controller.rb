class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @favorite_books = @user.liked_books.paginate(:page => params[:page], :per_page => 10)
    end
end
