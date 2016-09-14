class Account::FavoritesController < ApplicationController
  before_action :authenticate_user!
  layout "user"


  def index
    @books = current_user.favorite_books 
  end
end
