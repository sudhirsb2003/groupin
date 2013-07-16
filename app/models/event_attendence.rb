class EventAttendence < ActiveRecord::Base
  attr_accessible :event_id, :user_id, :status
  belongs_to :event
  belongs_to :user
end
