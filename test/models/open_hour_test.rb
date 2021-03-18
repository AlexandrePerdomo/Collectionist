# frozen_string_literal: true

require 'test_helper'

class OpenHourTest < ActiveSupport::TestCase
  should validate_inclusion_of(:day).in_array (1..7).to_a
  should validate_presence_of(:opens)
  should validate_presence_of(:closes)
  should validate_presence_of(:shop)

  test 'should check closes is after opens ' do
    open_hour = OpenHour.new(shop: shops(:one), day: 1, opens: Time.zone.now.midday,
                             closes: Time.zone.now.midday - 2.hours)
    assert_not open_hour.valid?
    assert open_hour.errors.include?(:closes)
    assert_includes open_hour.errors.messages_for(:closes),
                    I18n.t('errors.opens_before_closes')
  end
end
