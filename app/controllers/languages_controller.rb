class LanguagesController < ApplicationController

  before_action :set_user

  before_filter :authenticate

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

  def set_user
    @user = User.find(params[:user_id])
  end

  def language_params
    params.require(:language).permit(:language, :user_id)
  end

  def authenticate
    deny_access unless signed_in?
  end
end