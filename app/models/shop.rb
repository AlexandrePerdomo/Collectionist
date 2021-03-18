# frozen_string_literal: true

class Shop < ApplicationRecord
  validates :name, presence: true
  has_many :open_hours, dependent: :destroy

  def generate_open_hours
    open_hours.append(add_missing_days)
    orderred_days = open_hours.sort_by(&:day).rotate(Time.zone.today.strftime('%u').to_i)
    orderred_days.group_by(&:day)
  end

  def add_missing_days
    missing_days = []
    ((1..7).to_a - open_hours.map(&:day)).each do |missing_day|
      missing_days << OpenHour.new(day: missing_day, closed: true)
    end
    missing_days
  end
end
