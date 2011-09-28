class ApplicationController < ActionController::Base
  protect_from_forgery
  if Rails.env.production?
    http_basic_authenticate_with :name=>"admin", :password => "kvitunov"
  end
  
  before_filter :set_locale
  
  def set_locale
    if params[:locale]
      I18n.locale = params[:locale]
    else
      I18n.locale = :ru
    end
  end
  
  def default_url_options(options={})
    options.merge!({ :locale => I18n.locale }) unless I18n.locale==:ru
    options
  end
  
end
