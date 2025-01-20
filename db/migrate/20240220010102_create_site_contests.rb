# frozen_string_literal: true
class CreateSiteContests < ActiveRecord::Migration[7.1]
  def change
    create_table :site_contests do |t|
      t.belongs_to :site
      t.belongs_to :contest
      t.timestamps
    end
  end
end
