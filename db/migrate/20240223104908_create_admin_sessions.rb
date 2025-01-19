class CreateAdminSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :admin_sessions do |t|
      t.belongs_to :admin, null: false
      t.datetime :expires_at
      t.timestamps
    end
  end
end
