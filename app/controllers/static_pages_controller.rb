class StaticPagesController < ApplicationController
  before_action :correct_user, only: [:catalog]
  def home
  end

  def catalog
    @books = Book.paginate(page: params[:page], per_page: 20)
  end

  private

  def correct_user
    redirect_to root_url if current_user.nil?
  end
end
