class TandemsController < ApplicationController

  before_action :set_tandem, only: [:show, :edit, :update, :destroy]

  def new
    @tandems = @user.tandems.new
  end

  def create
    tandem_creator = TandemCreator.new(params[:language], current_user, invited_user)
    @tandem = tandem_creator.create
  end

  #uodate and pass thing s  to tandem

  private

  def invited_user
    @invited_user ||= User.find(params[:user_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def authenticate
    deny_access unless signed_in?
  end
end
