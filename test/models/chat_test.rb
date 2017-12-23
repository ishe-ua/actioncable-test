# frozen_string_literal: true

require 'test_helper'

class ChatTest < ActiveSupport::TestCase
  setup do
    @instance = build(:chat)
  end

  include ValidateInstanceTest
  include ValidateFixturesTest
end
