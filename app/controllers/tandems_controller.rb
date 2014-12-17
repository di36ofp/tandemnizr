class TandemsController < ApplicationController

 before_action :set_tandem, only: [:update]

 before_action :set_google_client

  def new
    @tandem = @user.tandems.new
    @results = @client.spots(41.386060099999995, 2.0473087, :types => ['cafe'])
    @map_required = true
  end

  def create
    tandem_creator = TandemCreator.new(params[:language], current_user, invited_user)
    @tandem = tandem_creator.create

    if @tandem
      @tandem.update(tandem_params)
      flash.now[:success] = "Invitation deliveried correctly!"
    else
      flash[:notice] = "Ups! something was wrong..."
      redirect_to :back
    end
    @map_required = true
  end

  def edit
    @participation =  current_user.participations.where(token: params[:token]).first
    @host_participation = User.where(id: Participation.confirmed.where(tandem_id: @participation.tandem_id).pluck(:user_id)).first
  end

 def update
   invitation = TandemInviter.new @tandem
   if invitation.accept_invitation(current_user, params[:token], params[:language])
     flash[:success] = "Tandem confirmed!!"
     redirect_to users_path
   end
 end

  private

  def invited_user
    @invited_user ||= User.find(params['tandem'][:user_id])
  end

  def set_tandem
    @tandem = Tandem.find(params[:id])
  end

  def tandem_params
    params.require(:tandem).permit(:place, :schedule)
  end

  def authenticate
    deny_access unless signed_in?
  end

  def set_google_client
    @client ||= GooglePlaces::Client.new('AIzaSyDskpMOceCFpY4KnCh9OC-mD6GuQPYR9sE')
  end
end
