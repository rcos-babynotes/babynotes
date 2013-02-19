class CreateBabies < ActiveRecord::Migration
  def change
    create_table :babies do |t|
      t.datetime :birth
      t.string :name
      t.references :user

      t.timestamps
    end
  end
end
