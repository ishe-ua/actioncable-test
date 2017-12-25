# frozen_string_literal: true

require 'test_helper'

class SayJobTest < ActiveJob::TestCase
  setup do
    @job = SayJob
  end

  test 'say' do
    skip
    mary = users(:mary)
    john = users(:john)

    assert job.perform_now(mary.id, john.id, 'test')
  end
end
