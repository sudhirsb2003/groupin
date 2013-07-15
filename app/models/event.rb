class Event < ActiveRecord::Base
  attr_accessible :address, :city_name, :contact_number, :country_name,
                  :end_time, :event_date, :name, :no_of_people,
                  :pincode, :start_time, :state_name

   validates_presence_of :city_name
   extend FriendlyId
   friendly_id :name, use: :slugged
  
   def should_generate_new_friendly_id?
     new_record? || slug.blank?
   end 
 
   acts_as_gmappable
   def gmaps4rails_address
     address
   end
   def gmaps4rails_infowindow
     "<h4>#{name}</h4>" << "<h4>#{address}</h4>"
   end
 
  
end
