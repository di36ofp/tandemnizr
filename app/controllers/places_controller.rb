class PlacesController < ApplicationController

  before_action :set_google_client

  def index
    lat = params[:latitude].to_f
    long = params[:longitude].to_f
    @places = @client.spots(lat, long, :types => ['cafe'])
  end

  private
  def set_google_client
    @client ||= GooglePlaces::Client.new('AIzaSyDskpMOceCFpY4KnCh9OC-mD6GuQPYR9sE')
  end
end