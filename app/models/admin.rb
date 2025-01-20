# frozen_string_literal: true
class Admin < ApplicationRecord
  has_secure_password

  has_many :sessions, class_name: "AdminSession"
end
