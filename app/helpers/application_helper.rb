module ApplicationHelper
  def android_app?
    request.env['HTTP_USER_AGENT'] == 'move-results-app'
  end
end
