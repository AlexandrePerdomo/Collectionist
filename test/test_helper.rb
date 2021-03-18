# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
if ENV['RAILS_ENV'] == 'test'
  require 'simplecov'
  SimpleCov.start 'rails'
end

require_relative '../config/environment'
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    def today_for_test
      Date.new(2020, 3, 27)
    end

    # Add more helper methods to be used by all tests here...
  end
end
