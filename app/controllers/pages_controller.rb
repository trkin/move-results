class PagesController < ApplicationController
  def home
    @recent_activities = Result.joins(check_points: [:discipline])
  end

  def sign_in_development
    return unless Rails.env.development? || Rails.application.secrets.is_staging

    user = User.find params[:id]
    sign_in :user, user, byepass: true
    redirect_to params[:redirect_to] || root_path
  end
end
