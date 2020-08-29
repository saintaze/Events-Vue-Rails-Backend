class Event < ApplicationRecord
  validates :title, :start, :end, :allDay, :borderColor, :backgroundColor, presence: true
end
