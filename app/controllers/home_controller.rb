class HomeController < ApplicationController
  include ApplicationHelper
  
  def index
   #@latest_events = latest_events(Date.today-10, Date.today)
   @json = Event.all.to_gmaps4rails
  end

end
