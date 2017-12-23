# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_session_path
    assert_response :success
  end

  test 'should get create - success' do
    post sessions_path(name: 'user')

    assert_equal cookies[:name], 'user'
    assert_redirected_to chats_path
  end

  test 'should get create - fail' do
    post sessions_path(name: '')

    assert_nil cookies[:name]
    assert_redirected_to new_session_path
  end
end
