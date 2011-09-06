class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
  end

  def user_signed_in?
  	super || bride_signed_in? || vendor_signed_in? || staff_signed_in?
  end

  def current_user
  	super || current_bride || current_vendor || current_staff
  end
end
