# frozen_string_literal: true

class Organisation < ApplicationRecord
  has_many :users
  has_many :shifts

  validates :name, presence: true
end
