# frozen_string_literal: true

require 'test_helper'

class AuthTest < ActionDispatch::IntegrationTest
  test 'index' do
    sign_in
    get chats_path
    assert_response :success
  end

  test 'redirect to sign in' do
    get chats_path
    assert_redirected_to new_session_path
  end
end
