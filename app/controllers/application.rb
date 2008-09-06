# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'b218b3beaf818e70c7bb3612d1928353'
  
  before_filter :set_locale

  # Will set the cookie 'locale' if (and only if) an explicit parameter 'locale'
  # is passed (and is acceptable)
  # If no cookie exists, we look through the list of desired languages for the
  # first one we can accept.
  def set_locale
    accept_locales = LOCALES.keys # change this line as needed, must be an array of strings
    cookies[:locale] = params[:locale] if accept_locales.include?(params[:locale])
    Locale.set(cookies[:locale] || (request.env["HTTP_ACCEPT_LANGUAGE"] || "").scan(/[^,;]+/).find{|l| accept_locales.include?(l)})
  end
  
  ActiveScaffold.set_defaults do |config| 
    config.ignore_columns.add [:created_at, :updated_at, :updated_by, :lock_version]
  end
end
