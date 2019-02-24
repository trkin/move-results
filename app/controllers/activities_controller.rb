class ActivitiesController < SuperadminController
  def index
    @activities = Activity.all
  end
end
