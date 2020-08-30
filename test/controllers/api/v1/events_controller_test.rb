require 'test_helper'

class Api::V1::EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  # index action test
  test "should get index" do
    get api_v1_events_url, as: :json
    assert_response :success
    response_data = JSON.parse(self.response.body)
    assert_equal response_data['events'].size, events().size
  end

  # create action test
  test "should create event with valid attributes" do
    assert_difference 'Event.count', 1 do
      new_event = {title: 'cooking', start: '2020-09-08', end: '2020-09-12', backgroundColor: 'green', borderColor: 'green', allDay: true}
      post api_v1_events_url, params: {event: new_event}, as: :json
    end
    assert_response :created
  end

  # create action test
  test "should not create event with invalid attributes" do
    assert_no_difference 'Event.count' do
      new_event = {title: 'cooking'}
      post api_v1_events_url, params: {event: new_event}, as: :json
    end
    assert_response :unprocessable_entity
  end

  # update action test
  test "should update event with valid attributes" do
    patch api_v1_event_url(@event), params: {event: {start: '2020-11-01', end: '2020-11-09'}}, as: :json
    assert_response :success
  end

  # update action test
  test "should not update event with invalid attributes or invalid id" do
    # fail with invalid event id
    patch api_v1_event_url(8982), params: {event: {start: '2020-11-01', end: '2020-11-09'}}, as: :json
    assert_response :unprocessable_entity
    
    # fail with invalid update params
    patch api_v1_event_url(@event), params: {event: {bookName: 'Rainbow Six'}}, as: :json
    assert_response :unprocessable_entity
  end

  # delete action test
  test "should delete event with valid id" do
    assert_difference 'Event.count', -1 do
      delete api_v1_event_url(@event)
    end
    assert_response :success
  end

  # delete action test
  test "should not delete event with invalid id" do
    assert_no_difference 'Event.count' do
      delete api_v1_event_url(8765)
    end
    assert_response :unprocessable_entity
  end
end
