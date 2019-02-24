class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home; end

  def sign_in_development
    return unless Rails.env.development? || Rails.application.secrets.is_staging

    user = User.find params[:id]
    sign_in :user, user, byepass: true
    redirect_to params[:redirect_to] || root_path
  end
end
