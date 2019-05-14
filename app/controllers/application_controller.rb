class ApplicationController < ActionController::Base
  around_action :_set_locale_from_session
  before_action :authenticate_user!, except: :set_locale

  def _set_locale_from_session
    locale = current_user&.locale ||
             _extract_locale_from_http_accept_language_and_set_to_session
    if locale.present?
      I18n.with_locale locale.to_sym do
        yield
      end
    else
      yield
    end
  end

  def _extract_locale_from_http_accept_language_and_set_to_session
    return session[:locale] if session[:locale].present?

    locale = request.env['HTTP_ACCEPT_LANGUAGE'].to_s.scan(/^[a-z]{2}/).first
    session[:locale] = locale if locale.present? && I18n.available_locales.include?(locale.to_sym)
  end

  # rubocop:disable Metrics/AbcSize
  def set_locale
    if params[:locale].present? && I18n.available_locales.include?(params[:locale].to_s.to_sym)
      session[:locale] = params[:locale]
      if current_user.present? && current_user.locale != params[:locale]
        current_user.locale = params[:locale]
        current_user.save!
        flash[:notice] = t('data_item_name_successfully_changed', item_name: User.human_attribute_name(:locale))
      end
    end
    redirect_to root_path
  end
  # rubocop:enable Metrics/AbcSize

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  # initialize object and call with params and redirect path
  # redirect_path can be proc so it redirects to show page after create
  #
  #  def new
  #    @subscriber = current_user.company.subscribers.new country: current_user.company.country
  #    render partial: 'form', layout: false
  #  end
  #  def create
  #    @subscriber = current_user.company.subscribers.new
  #    update_and_render_or_redirect_in_js @subscriber, _subscriber_params, ->(id) { subscriber_path(id) }
  #  end
  def update_and_render_or_redirect_in_js(item, item_params, redirect_path_or_proc, partial = 'form')
    notice = if item.new_record?
               helpers.t_notice('successfully_created', item.class)
             else
               helpers.t_notice('successfully_updated', item.class)
             end
    item.assign_attributes item_params
    if item.save
      flash[:notice] = flash.now[:notice] = notice
      redirect_path = if redirect_path_or_proc.class == Proc
                        redirect_path_or_proc.call item.id
                      else
                        redirect_path_or_proc
                      end
      render js: %(
        window.location.assign('#{redirect_path}');
      )
    else
      flash.now[:alert] = item.errors.full_messages.to_sentence
      render js: %(
        var form = document.getElementById('form');
        form.innerHTML = '#{helpers.j helpers.render partial}';
      )
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end
