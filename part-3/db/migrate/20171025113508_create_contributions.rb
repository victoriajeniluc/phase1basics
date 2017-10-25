class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.integer :attendee_id
      t.integer :potluck_id
      t.string :food_item, null: false

      t.timestamps
    end
  end
end
