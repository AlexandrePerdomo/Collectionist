# frozen_string_literal: true

class Shop < ApplicationRecord
  validates :name, presence: true
  has_many :open_hours, dependent: :destroy
end
