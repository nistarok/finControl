class ApplicationController < ActionController::Base
  around_action :switch_locale

  def switch_locale(&action)
    locale = "pt-br"
    I18n.with_locale(locale, &action)
  end
end
