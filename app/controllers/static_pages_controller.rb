class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:catalog]
  def home
  end

  def catalog
    @books = Book.paginate(page: params[:page], per_page: 20)
  end
end
