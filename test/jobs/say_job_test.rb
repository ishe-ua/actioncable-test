# frozen_string_literal: true

require 'test_helper'

class SayJobTest < ActiveJob::TestCase
  setup do
    @job = SayJob
  end

  test 'say' do
    chat_pair = Chat.key_pair(10, 20).join('_')
    assert job.perform_now(chat_pair, 'test')
  end
end
