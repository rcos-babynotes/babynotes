class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.float :height
      t.float :weight
      t.references :baby

      t.timestamps
    end
  end
end
