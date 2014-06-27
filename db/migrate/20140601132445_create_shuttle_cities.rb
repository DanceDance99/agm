class CreateShuttleCities < ActiveRecord::Migration
  def change
    create_table :shuttle_cities do |t|
      t.belongs_to :shuttle
      t.string :name
      t.timestamps
    end
  end
end
