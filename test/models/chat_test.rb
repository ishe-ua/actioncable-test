# frozen_string_literal: true

require 'test_helper'

class ChatTest < ActiveSupport::TestCase
  setup do
    @instance = build(:chat)
  end

  include ValidateInstanceTest
  include ValidateFixturesTest

  test 'find_for' do
    user1, user2 = prepare_chat
    assert instance.class.find_for(user1, user2)
  end

  test 'say with create new chat' do
    mary_id = users(:mary).id
    john_id = users(:john).id

    instance.class.delete_all
    assert_difference 'Chat.count' do
      instance.class.say(mary_id, john_id, 'hello')
    end
  end

  test 'say with update exist chat' do
    assert instance.save
    chat = instance

    mary_id = chat.a_id
    john_id = chat.b_id

    instance.class.say(mary_id, john_id, 'hello')
    assert_equal instance.reload.log.size, 1
  end

  private

  def prepare_chat
    user1 = build(:user, name: 'user1')
    user2 = build(:user, name: 'user2')

    user1.save
    user2.save

    assert_difference 'Chat.count' do
      instance.class.say(user1.reload.id, user2.reload.id, 'any')
    end

    [user1, user2]
  end
end
