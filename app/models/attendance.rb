class Attendance < ApplicationRecord
  belongs_to :User
  belongs_to :Event
end
