class CreateSiteOrganisers < ActiveRecord::Migration[7.1]
  def change
    create_table :site_organisers do |t|
      t.belongs_to :site
      t.belongs_to :organisation
      t.timestamps
    end
  end
end
