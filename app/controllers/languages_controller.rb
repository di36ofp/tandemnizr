class LanguagesController < ApplicationController

  def index
    @user = set_user
    @languages = @user.languages
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def user_params
    params.require(:language).permit(:language, :user_id)
  end
end