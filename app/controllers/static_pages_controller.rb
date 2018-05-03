class StaticPagesController < ApplicationController
  def home
  end

  def catalog
    @books = Book.paginate(page: params[:page], per_page: 20)
  end
end
