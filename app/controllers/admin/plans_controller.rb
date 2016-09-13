class Admin::PlansController < AdminController
  def index
    @plans = Plan.all
    drop_breadcrumb "Plans"
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)

    if @plan.save
      redirect_to admin_plans_path
    else
      render :new
    end
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])

    if @plan.update(plan_params)
      redirect_to admin_plans_path
    else
      render :edit
    end
  end

  def destroy
    @plan = Plan.find(params[:id])

    @plan.destroy
    redirect_to admin_plans_path
  end

  protected

  def plan_params
    params.require(:plan).permit(:name, :plan_date, :price)
  end
end
