# frozen_string_literal: true

require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should have_many(:open_hours)

  test 'add_missing_days should generate missing days' do
    missing_days = shops(:one).add_missing_days
    assert_equal missing_days.length, 5
    assert_equal missing_days.map(&:day), [2, 4, 5, 6, 7]
  end

  test 'generate_open_hours should generate open_hours hash' do
    Timecop.freeze(today_for_test) # Vendredi
    open_hours_hash = shops(:one).generate_open_hours
    assert_equal open_hours_hash.keys, [5, 6, 7, 1, 2, 3, 4]
    assert_equal open_hours_hash[1].length, 2
    assert_equal open_hours_hash[3].length, 1
    assert_equal open_hours_hash[7].length, 1
  end
end
