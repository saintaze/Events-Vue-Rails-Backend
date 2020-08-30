require 'test_helper'

class EventTest < ActiveSupport::TestCase
  setup do
    @event_valid = Event.new(title: 'walking', start: '2020-05-03', end: '2020-05-08', allDay: true, backgroundColor: 'purple', borderColor: 'purple')
    @event_invalid = Event.new(title: 'dancing')
  end

  test 'event with valid attributes should be valid' do
    assert @event_valid.valid?
  end

  test 'event with invalid attributes should be invalid' do
    assert_not @event_invalid.valid?
  end

  test 'Event with valid attributes should be saved' do
    assert_difference 'Event.count' do
      @event_valid.save
    end
  end

  test 'Event with invalid attributes should not be saved' do
    assert_no_difference 'Event.count' do
      @event_invalid.save
    end
  end
end