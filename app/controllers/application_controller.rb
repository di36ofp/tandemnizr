class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  before_action :set_user
  before_filter :authenticate

  private

  def set_user
    @user = User.find_by_id(params[:user_id])
  end

  def authenticate
    deny_access unless signed_in?
  end
end
