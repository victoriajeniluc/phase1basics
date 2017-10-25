class CreatePotlucks < ActiveRecord::Migration
  def change
    create_table :potlucks do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.datetime :starts_at
      t.integer :host_id

      t.timestamps
    end
  end
end
