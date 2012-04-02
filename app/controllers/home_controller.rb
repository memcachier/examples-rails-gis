class HomeController < ApplicationController
  def index
  end
  
  def lookup
    location_name = params[:location]
    in_cache = Rails.cache.read(location_name)
    
    if in_cache
      coordinates = in_cache
      message = "hit"
    else
      result = Geocoder.search(location_name).first
      coordinates = "#{result.latitude},#{result.longitude}"
      message = "miss"
      
      Rails.cache.write(location_name, coordinates)
    end
    
    render :inline => "#{coordinates}<br />cache: #{message}"
  end
end
