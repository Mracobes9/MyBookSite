class StaticPagesController < ApplicationController
  def home
  end

  def catalog
    @books = Book.all
  end
end
