class HomeController < ApplicationController
  def index
  end
  
  def lookup
    result = Geocoder.search(params[:location]).first
    render :inline => "#{result.latitude},#{result.longitude}"
  end
end
