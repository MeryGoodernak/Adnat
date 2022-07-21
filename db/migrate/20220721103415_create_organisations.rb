class CreateOrganisations < ActiveRecord::Migration[7.0]
  def change
    create_table :organisations do |t|
      t.string :name, null: false, default: ""
      t.float :hourly_rate, null: false, default: 0

      t.timestamps
    end
  end
end
