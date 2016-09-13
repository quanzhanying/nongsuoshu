class Admin::CategoriesController < AdminController
  before_action :find_category_by_id, only:[:edit,:update,:destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "分类更新成功"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:notice] = "分类删除成功"
      redirect_to admin_categories_path
    end
  end

 protected

 def find_category_by_id
   @category = Category.find(params[:id])
 end

  private

  def category_params
    params.require(:category).permit(:name, :chs_name)
  end
end
