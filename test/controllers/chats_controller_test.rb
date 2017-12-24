# frozen_string_literal: true

require 'test_helper'

class ChatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in
  end

  test 'should get index' do
    get chats_path
    assert_response :success
  end

  test 'should get show' do
    get chat_path(users(:mary))
    assert_response :success
  end
end
