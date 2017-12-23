# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_session_path
    assert_response :success
  end

  test 'should sign in if user exists' do
    post sessions_path(name: 'mary')

    assert_equal cookies[:user_id].to_i, users(:mary).id
    assert_redirected_to chats_path
  end

  test 'should create user and sign in if user do not exists' do
    assert_difference 'User.count' do
      post sessions_path(name: 'mary2')
    end

    assert_not_nil cookies[:user_id]
    assert_redirected_to chats_path
  end

  test 'should redirect to new if empty user' do
    post sessions_path(name: '')

    assert_nil cookies[:user_id]
    assert_redirected_to new_session_path
  end
end
