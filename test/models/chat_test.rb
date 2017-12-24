# frozen_string_literal: true

require 'test_helper'

class ChatTest < ActiveSupport::TestCase
  setup do
    @instance = build(:chat)
  end

  include ValidateInstanceTest
  include ValidateFixturesTest

  test 'find_for' do
    user1, user2 = prepare_two_users2
    assert instance.class.find_for(user1, user2)
  end

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

  private

  def prepare_two_users2
    user1 = build(:user, name: 'user1')
    user2 = build(:user, name: 'user2')

    user1.save
    user2.save

    [user1.reload, user2.reload]
  end
end
