class SuperadminController < ApplicationController
  before_action :_check_superadmin_user

  def _check_superadmin_user
    return if current_user.superadmin?

    # Notify.message('_check_admin_user', current_user: current_user)
    redirect_to root_path, alert: t('only_for_superadmin')
  end
end
