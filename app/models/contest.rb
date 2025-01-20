# frozen_string_literal: true

class Contest < ApplicationRecord
  scope :starts_in_future, -> { where(starts_at: Time.current..) }
  scope :ends_in_past, -> { where(ends_at: ..Time.current) }

  validates :name, :starts_at, :ends_at, presence: true

  has_many :site_contests
  has_many :sites, through: :site_contests
end
