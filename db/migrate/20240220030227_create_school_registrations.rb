# frozen_string_literal: true
class CreateSchoolRegistrations < ActiveRecord::Migration[7.1]
  def change
    create_table :school_registrations do |t|
      t.belongs_to :site_contest
      t.belongs_to :user
      t.string :name, null: false
      t.timestamps
    end
  end
end
