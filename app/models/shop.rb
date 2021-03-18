# frozen_string_literal: true

class Shop < ApplicationRecord
  validates :name, presence: true
  has_many :open_hours, dependent: :destroy
  accepts_nested_attributes_for :open_hours, allow_destroy: true, reject_if: :all_blank

  def generate_open_hours
    # Add closing days
    open_hours.append(add_missing_days)
    # Order open_hours by day in a hash
    orderred_days = open_hours.sort_by(&:day).group_by(&:day)
    # Convert hash to array, rotate it then convert back to hash
    orderred_days.to_a.rotate(Time.zone.today.strftime('%u').to_i - 1).to_h
  end

  def add_missing_days
    missing_days = []
    ((1..7).to_a - open_hours.map(&:day)).each do |missing_day|
      missing_days << OpenHour.new(day: missing_day, closed: true)
    end
    missing_days
  end
end
