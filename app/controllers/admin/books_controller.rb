class Admin::BooksController < ApplicationController
  before_action :find_book_by_id, only: [:edit, :update, :destroy, :publish, :offline]
  layout "admin"
  
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
      if @book.save
        flash[:notice] = "浓缩书创建成功"
        redirect_to admin_books_path
      else
        render :new
      end

  end

  def update
    if @book.update(book_params)
      flash[:notice] = "浓缩书更新成功"
      redirect_to admin_books_path
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    flash[:alert] = "浓缩书删除成功"
    redirect_to admin_books_path
  end


  protected

  def find_book_by_id
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :content)
  end

end
