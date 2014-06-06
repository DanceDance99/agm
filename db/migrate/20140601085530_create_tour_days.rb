class CreateTourDays < ActiveRecord::Migration
  def change
    create_table :tour_days do |t|
      t.belongs_to :tour
      t.date :day
      t.integer :capacity
      t.integer :available
      t.timestamps
    end
  end
end
