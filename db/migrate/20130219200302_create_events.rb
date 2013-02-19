class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description
      t.string :type
      t.datetime :happened_at
      t.references :baby

      t.timestamps
    end
  end
end
