class Admin::BooksController < AdminController
  before_action :find_book_by_id, only: %i(edit update destroy publish hide)
  layout "admin"

  def index
    @books =
      if params[:category_id]
        Book.recent.where(category_id: params[:category_id]).includes(:category).paginate(page: params[:page], per_page: 20)
      else
        Book.all.recent.includes(:category).paginate(page: params[:page], per_page: 20)
      end
    @categories = Category.all
  end

  def new
    @book = Book.new
    @categories = Category.all
  end

  def new_import
  end

  def create_import
    if params[:file].present?
      Book.import(params[:file])
      redirect_to admin_books_path, notice: "Books imported."
    else
      flash[:warning] = "You need to upload something"
      render :new_import
    end
  end

  def edit
    @categories = Category.all
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

  def publish
    @book.publish!
    flash[:notice] = "已将该浓缩书上线"
    redirect_to :back
  end

  def hide
    @book.hide!
    flash[:notice] = "已将该浓缩书下线"
    redirect_to :back
  end

  protected

  def find_book_by_id
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :content, :category_id)
  end
end
