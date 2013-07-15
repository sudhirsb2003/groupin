module ApplicationHelper

 def simple_class_for flash_type
   case flash_type
   when :success
   "alert-success"
   when :error
   "alert-error"
   when :alert
   "alert-block"
   when :notice
   "alert-info"
   else
   flash_type.to_s
   end
 end


 def difference_of_days_between(date)
   time_ago_in_words(date)
 end

  def latest_events(start_date, end_date)
    @le = Event.find_all_by_event_date(start_date..end_date)
  end   
end
