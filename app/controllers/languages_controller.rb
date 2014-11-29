class LanguagesController < ApplicationController

  def index
    @languages = @user.languages
  end

  def new
    @languages = @user.languages.new
  end

  def create
    @user = set_user
    @languages = @user.languages.new (language_params)
    if @languages.save
      flash[:success] = "Language successfully added"
      redirect_to @user
    else
      flash[:notice] = "Language couldn't be added"
      render 'new'
    end
  end

  private

  def language_params
    params.require(:language).permit(:language, :user_id)
  end
end