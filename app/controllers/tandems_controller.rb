class TandemsController < ApplicationController

  before_action :set_tandem, only: [:show, :edit, :update, :destroy]

  def new
    @tandems = @user.tandems.new
  end

  def create
    tandem_creator = TandemCreator.new
    tandem_creator.add current_user
    tandem_creator.set_language current_user, params[:language]
    tandem_creator.invite User.find(params[:user_id])
    @tandem = tandem_creator.tandem
  end

  #uodate and pass thing s  to tandem
end
