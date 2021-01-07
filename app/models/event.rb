class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, class_name: 'User'

  scope :upcoming, -> { where('date >= ?', Date.today) }
  scope :past, -> { where('date < ?', Date.today) }

  validates :title, length: { minimum: 3, maximum: 90 }
  validates_presence_of :title, :description, :date, :location
end
