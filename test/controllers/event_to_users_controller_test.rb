require 'test_helper'

class EventToUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_to_user = event_to_users(:one)
  end

  test "should get index" do
    get event_to_users_url
    assert_response :success
  end

  test "should get new" do
    get new_event_to_user_url
    assert_response :success
  end

  test "should create event_to_user" do
    assert_difference('EventToUser.count') do
      post event_to_users_url, params: { event_to_user: { event_id: @event_to_user.event_id, user_id: @event_to_user.user_id } }
    end

    assert_redirected_to event_to_user_url(EventToUser.last)
  end

  test "should show event_to_user" do
    get event_to_user_url(@event_to_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_to_user_url(@event_to_user)
    assert_response :success
  end

  test "should update event_to_user" do
    patch event_to_user_url(@event_to_user), params: { event_to_user: { event_id: @event_to_user.event_id, user_id: @event_to_user.user_id } }
    assert_redirected_to event_to_user_url(@event_to_user)
  end

  test "should destroy event_to_user" do
    assert_difference('EventToUser.count', -1) do
      delete event_to_user_url(@event_to_user)
    end

    assert_redirected_to event_to_users_url
  end
end
