# frozen_string_literal: true

class OpenHour < ApplicationRecord
  attr_accessor :closed

  belongs_to :shop

  validates :day, :closes, :opens, :shop, presence: true
  validates :day, inclusion: { in: 1..7 }
  validate :opens_before_closes

  def opens_before_closes
    return if opens && closes && opens <= closes

    errors.add(:closes, I18n.t('errors.opens_before_closes'))
  end
end
