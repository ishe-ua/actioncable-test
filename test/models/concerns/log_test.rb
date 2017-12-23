# frozen_string_literal: true

require 'test_helper'

class LogTest < ActiveSupport::TestCase
  setup do
    @instance = build(:chat)
  end

  test 'empty by default' do
    assert_empty instance.log
  end

  test 'not nil' do
    instance.log = nil
    assert_raise { instance.save! }
  end
end
