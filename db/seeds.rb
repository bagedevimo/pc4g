# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Admin.create!(email: "fake@example.com", password: "password")

Contest.create!(
  name: "Example upcoming contest",
  starts_at: 10.days.from_now.change(hour: 9),
  ends_at: 10.days.from_now.change(hour: 17)
)

Contest.create!(
  name: "Example past contest",
  starts_at: 10.days.ago.change(hour: 9),
  ends_at: 10.days.ago.change(hour: 17)
)
