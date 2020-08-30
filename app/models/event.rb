class Event < ApplicationRecord
  validates :title, :start, :end, :borderColor, :backgroundColor, presence: true
  validates :allDay, inclusion: [true, false]
end
