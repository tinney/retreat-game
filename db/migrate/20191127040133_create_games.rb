class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.boolean :active
      t.timestamps
    end

    create_table :players do |t|
      t.string :name, null: false
      t.integer :water_stat, null: false, default: 0
      t.integer :food_stat, null: false, default: 0
      t.integer :movement_stat, null: false, default: 0
      t.integer :stamina_stat, null: false, default: 0
      t.timestamps
    end

    create_table :attempts do |t|
      t.integer :player_id
      t.boolean :active
      t.integer :days_active
      t.integer :x_location
      t.integer :y_location
      t.integer :water_count
      t.integer :food_count
      t.timestamps
    end
  end
end
