class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :Attendances
  has_many :attendees, through: :Attendances

  scope: :upcoming, -> { where("date >= ?", Date.today) }
  scope: :past, -> { where("date < ?", Date.today) }
end
