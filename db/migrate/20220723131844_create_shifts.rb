class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.datetime :started_at, null: false
      t.datetime :ended_at, null: false
      t.integer :break_length, null: false, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :organisation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
