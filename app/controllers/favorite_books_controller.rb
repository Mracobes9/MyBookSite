class FavoriteBooksController < ApplicationController
  before_action :authenticate_user!, only:[:create, :destroy]
  def create
    book = current_user.favorite_books.new(book_id:params[:format])

    flash[:notice] = "Книга добавлена" if book.save
    redirect_to catalog_url
  end

  def destroy
    #byebug
    book = current_user.favorite_books.find_by(book_id: params[:format])
    flash[:notice] = "Книга удалена" if book.destroy
    redirect_back fallback_location: root_url
  end

end
