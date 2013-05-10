class AddPercentilesToMeasurements < ActiveRecord::Migration
  def change
  	add_column :measurements, :height_percentile, :integer
  	add_column :measurements, :weight_percentile, :integer
  end
end
