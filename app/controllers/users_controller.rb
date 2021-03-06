class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  skip_before_filter :authenticate, :only => [:new, :create, :show, :destroy]

  def index
    @users = User.find_by_languages(current_user).paginate(:page => params[:page])

  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User successfully created"
      redirect_to @user
    else
      flash[:notice] = "User can't be created"
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User successfully updated"
      sign_in @user
      redirect_to @user
    else
      flash[:notice] = "User can't be updated"
      render 'edit'
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "User successfully created"
      redirect_to users_url
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :nationality, :city, :cp, :age, :career, :photo, :description)
  end

  def correct_user
    redirect_to(root_path) unless current_user?(@user)
  end
end
