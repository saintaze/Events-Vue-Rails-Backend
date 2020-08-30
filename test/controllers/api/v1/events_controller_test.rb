require 'test_helper'

class Api::V1::EventsControllerTest < ActionDispatch::IntegrationTest
  
  # index test
  test "should get index" do
    get api_v1_events_url, as: :json
    assert_response :success
    response_data = JSON.parse(self.response.body)
    assert_equal response_data['events'].size, events().size
  end

  # create test
  test "should create event with valid attributes" do
    assert_difference 'Event.count', 1 do
      new_event = {title: 'cooking', start: '2020-09-08', end: '2020-09-12', backgroundColor: 'green', borderColor: 'green', allDay: true}
      post api_v1_events_url, params: {event: new_event}, as: :json
    end
    assert_response :created
  end

  # create test
  test "should not create event with invalid attributes" do
    assert_no_difference 'Event.count' do
      new_event = {title: 'cooking'}
      post api_v1_events_url, params: {event: new_event}, as: :json
    end
    assert_response :unprocessable_entity
  end

  # test "should get update" do
  #   get api_v1_events_update_url
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   get api_v1_events_destroy_url
  #   assert_response :success
  # end

end
