class ChangeHighlightsTypeInTours < ActiveRecord::Migration
  def change
    change_column :tours, :highlights, :text
  end
end
