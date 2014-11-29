class SessionsController < ApplicationController

  skip_before_filter :authenticate

  def new
  end

  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user.nil?
      flash.now[:notice] = "Invalid email/password combination."
      render :action => "new"
    else
      sign_in(user)
      redirect_back_or user
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
