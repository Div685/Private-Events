class Attendance < ApplicationRecord
  belongs_to :attendee, class_name: 'user'
  belongs_to :attended_event, class_name: 'event'

  enum status: { invited: 0, accepted: 1}
end
