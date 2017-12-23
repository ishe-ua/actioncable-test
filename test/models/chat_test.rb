# frozen_string_literal: true

require 'test_helper'

class ChatTest < ActiveSupport::TestCase
  setup do
    @instance = build(:chat)
  end

  include ValidateInstanceTest
  include ValidateFixturesTest

  test 'say for exist chat' do
    skip
    assert instance.save
    chat = instance

    mary_id = chat.a_id
    john_id = chat.b_id

    Chat.say(mary_id, john_id, 'test message')
    assert_equal instance.log.size, 1
  end
end
