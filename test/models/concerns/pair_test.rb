# frozen_string_literal: true

require 'test_helper'

class PairTest < ActiveSupport::TestCase
  setup do
    @instance = build(:chat)
  end

  test 'a_id is required field' do
    instance.a_id = nil
    assert_not instance.valid?
  end

  test 'b_id is required field' do
    instance.b_id = nil
    assert_not instance.valid?
  end
end
