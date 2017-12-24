# frozen_string_literal: true

require 'test_helper'

class ChatTest < ActiveSupport::TestCase
  setup do
    @instance = build(:chat)
  end

  include ValidateInstanceTest
  include ValidateFixturesTest

  test 'say' do
    assert instance.save
    chat = instance

    mary_id = chat.a_id
    john_id = chat.b_id

    instance.class.say(mary_id, john_id, 'hello')
    assert_equal instance.reload.log.size, 1

    instance.class.say(john_id, mary_id, 'hi')
    assert_equal instance.reload.log.size, 2
  end
end
