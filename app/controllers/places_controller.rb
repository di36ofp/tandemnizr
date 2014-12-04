class PlacesController < ApplicationController

  before_action :set_google_client

  def index
    @places = @client.spots(41.395603613998205, 2.157095799999979, :types => ['cafe'])
  end

  def set_google_client
    @client ||= GooglePlaces::Client.new('AIzaSyDskpMOceCFpY4KnCh9OC-mD6GuQPYR9sE')
  end
end