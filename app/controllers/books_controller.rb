class BooksController < ApplicationController
  before_action :set_book, only: %i(show edit update destroy add_to_favorites remove_favorites)
  before_action :validate_search_key, only: [:search]
  # before_action :authenticate_user!, only: [:add_to_favorites, :remove_favorites]
  # GET /books
  # GET /books.json
  def index
    @books =
      if params[:category_id]
        Book.where("category_id = ?", params[:category_id])
      else
         Book.all.paginate(page: params[:page], per_page: 3)
      end
    @categories = Category.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
    rand_num = rand(10) + 1
    @books = Book.recommend(rand_num)
    unless @book.can_display_for_user(current_user)
      render :preview
      return
    end

    set_page_title @book.title
    drop_breadcrumb(@book.title, book_path(@book))
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    if @query_string.present?
      free_to_read?(nil)
      search_result = Book.ransack(@search_criteria).result(distinct: true)
      @books_search = search_result.paginate(page: params[:page], per_page: 5)
    end
  end

  def add_to_favorites
    message = {}
    unless current_user
      message[:needlogin] = "y"
      render json: message
      return
    end
    if !current_user.has_added_to_favorites?(@book)
      current_user.add_to_favorites!(@book)
      message[:status] = "y"
    else
      message[:status] = "n"
    end
    render json: message
  end

  def remove_favorites
    message = {}
    unless current_user
      message[:needlogin] = "y"
      render json: message
      return
    end
    if current_user.has_added_to_favorites?(@book)
      current_user.remove_favorites!(@book)
      message[:status] = "y"
    else
      message[:status] = "n"
    end
    render json: message
  end

  protected

  def free_to_read?(book)
    @is_valid_subscriber = true
    unless current_user
      @is_valid_subscriber = false
    end
    if current_user && !current_user.valid_subscriber?
      @is_valid_subscriber = false
    end
    if book && book.is_free
      @is_valid_subscriber = true
    end
  end

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
    { title_cont: query_string }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find_by_token(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_params
    params.require(:book).permit(:title, :content, :category_id)
  end
end
