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

  def plan_params
    params.require(:plan).permit(:name, :plan_date, :price)
  end
end
