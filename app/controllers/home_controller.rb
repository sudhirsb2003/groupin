class HomeController < ApplicationController
  include ApplicationHelper
  
  def index
   #@latest_events = latest_events(Date.today-10, Date.today)
   #@json = Event.all.to_gmaps4rails
   @json = Event.all.to_gmaps4rails
    @polyjson = []
    points = []

    Event.all.each do |l|
      points << {:lng => l.longitude, :lat => l.latitude}
    end
    @polyjson = [points].to_json
 end

end
