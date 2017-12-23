# frozen_string_literal: true

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

Dir[
  Rails.root.join('test', 'support', '**', '*.rb'),
  Rails.root.join('test', '**', 'shared', '**', '*.rb')
].each { |f| require f }

# For mock and stub
require 'minitest/autorun'

class ActiveSupport::TestCase
  attr_reader :instance, :modul, :klass, :mailer, :job
  delegate :class, to: :instance, prefix: true

  fixtures :all
  include ActiveRecord::Tasks::DatabaseTasks # for fixtures_path
end

class ActionDispatch::IntegrationTest
  include ActionMailer::TestHelper
  include ActiveJob::TestHelper
end
