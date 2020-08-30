require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test 'event with valid attributes should be valid' do
    event = Event.new(title: 'walking', start: '2020-05-03', end: '2020-05-08', allDay: true, backgroundColor: 'purple', borderColor: 'purple')
    assert event.valid?
  end

  test 'event with invalid attributes should be invalid' do
    event = Event.new(title: 'dancing')
    assert_not event.valid?
  end
end