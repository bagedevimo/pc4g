class CreateSites < ActiveRecord::Migration[7.1]
  def change
    create_table :sites do |t|
      t.string :label, null: false
      t.string :address, null: false
      t.integer :maximum_participants, null: false
      t.timestamps
    end
  end
end
