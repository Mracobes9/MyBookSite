module BooksHelper
  def correct_user_for_comments?
    !current_user.nil? && !current_user.admin?
  end
  def valid_book_for_add?(book)
    current_page?(catalog_url) && user_signed_in? && !FavoriteBook.where(user_id: current_user.id, book_id: book.id).exists?
  end
  def valid_book_for_remove?(book)
    !current_user.nil? && FavoriteBook.where(user_id: current_user.id, book_id: book.id).exists?
  end
end
