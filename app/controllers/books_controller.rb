class BooksController < ApplicationController
  before_action :set_book, only: %i(show edit update destroy)
  before_action :validate_search_key, only: [:search]
  # GET /books
  # GET /books.json
  def index
    @books =
      if params[:category_id]
        Book.where("category_id = ?", params[:category_id])
      else
        @books = Book.all.paginate(page: params[:page], per_page: 3)
      end
    @categories = Category.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
    unless current_user
      @book.content = view_context.truncate(@book.content, length: 140)
    end
    if current_user && !current_user.valid_subscriber?
      @book.content = view_context.truncate(@book.content, length: 140)
    end
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
      search_result = Book.ransack(@search_criteria).result(distinct: true)
      @books_search = search_result.paginate(page: params[:page], per_page: 3)
    end
  end

  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
    { title_cont: query_string, content_cont: query_string, m: "or" }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_params
    params.require(:book).permit(:title, :content, :category_id)
  end
end
