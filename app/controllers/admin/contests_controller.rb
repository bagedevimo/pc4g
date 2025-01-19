class Admin::ContestsController < Admin::BaseController
  def index
    @upcoming_contests = Contest.starts_in_future
    @past_contests = Contest.ends_in_past
  end

  def new
    @contest = Contest.new
  end

  def create
    @contest = Contest.new(contest_params)

    if @contest.save
      redirect_to admin_contest_path(@contest)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @contest = Contest.find(params[:id])
  end

  private

  def contest_params
    params.require(:contest).permit(:name, :starts_at, :ends_at)
  end
end
