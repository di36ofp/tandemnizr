class TandemsController < ApplicationController

  before_action :set_tandem, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate

  def new
    @tandems = @user.tandems.new
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_tandem
    @tandem = Tandem.find(params[:id])
  end

  def authenticate
    deny_access unless signed_in?
  end
end
