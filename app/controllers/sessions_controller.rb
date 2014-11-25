class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user.nil?
      flash.now[:notice] = "Invalid email/password combination."
      render 'new'
    else
      sign_in(user)
      redirect_to users_url
    end
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end


  def session_params
    params.require(:session).permit(:email, :password)
  end
end
