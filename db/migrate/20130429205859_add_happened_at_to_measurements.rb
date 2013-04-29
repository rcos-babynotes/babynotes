class AddHappenedAtToMeasurements < ActiveRecord::Migration
  def change
  	add_column :measurements, :happened_at, :datetime
  end
end
