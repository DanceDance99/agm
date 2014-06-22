class CreateShuttleLegs < ActiveRecord::Migration
  def change
    create_table :shuttle_legs do |t|
      t.belongs_to :shuttle
      t.belongs_to :from      
      t.belongs_to :to
      t.integer  "capacity"
      t.integer  "available"
      t.date :day      
      t.timestamps
    end
  end
end
