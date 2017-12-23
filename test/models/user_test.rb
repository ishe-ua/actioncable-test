# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @instance = build(:user)
  end

  include ValidateInstanceTest
  include ValidateFixturesTest

  test 'required field' do
    instance.name = nil
    assert_not instance.valid?
  end

  test 'name is uniqueness' do
    instance.name = instance.class.all.sample.name
    assert_not instance.valid?
  end
end
