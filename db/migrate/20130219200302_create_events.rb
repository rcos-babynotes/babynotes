class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :description
      t.string :title
      t.string :type
      t.datetime :happened_at
      t.references :baby

      t.timestamps
    end
    add_index :events, [:baby, :created_at]
  end
end
