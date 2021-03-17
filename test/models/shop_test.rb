# frozen_string_literal: true

require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
end
