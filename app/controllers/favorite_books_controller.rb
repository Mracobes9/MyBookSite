class FavoriteBooksController < ApplicationController
  def create
    user_id = current_user.id
    book_id = params[:format]

    book=FavoriteBook.new(user_id: user_id, book_id: book_id)
    if book.save
      flash[:notice] = "Книга добавлена"
    else
      flash[:alert] = "Произошла ошибка"
    end
    redirect_to catalog_url
  end

  def destroy
    user_id = current_user.id
    book_id = params[:format]

    book=FavoriteBook.where(user_id: user_id, book_id: book_id).first
    if book.nil? || book.destroy
      flash[:notice] = "Книга удалена"
    else
      flash[:alert] = "Произошла ошибка"
    end
    redirect_back fallback_location: root_url
  end
end
