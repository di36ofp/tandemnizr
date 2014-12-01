class TandemsController < ApplicationController

 before_action :set_tandem, only: [:show, :destroy]

  def new
    @tandems = @user.tandems.new
  end

  def create
    tandem_creator = TandemCreator.new(params[:language], current_user, invited_user)
    @tandem = tandem_creator.create
  end

  def edit
    @participation = current_user.participations.find_by(token: params[:token])
    @host_participation = User.where(id: Participation.where(tandem_id: @participation.tandem_id, confirmed: true).pluck(:user_id)).first
    render 'new'
  end

  def update
      Participation.update(language: params[:language], confirmed: true)
  end

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
