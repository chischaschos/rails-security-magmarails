class ApplicationController < ActionController::Base
  layout 'application'
  protect_from_forgery
  before_filter :authenticate_user!
end
