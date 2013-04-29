class AddGenderToBabies < ActiveRecord::Migration
  def change
    add_column :babies, :gender, :string
  end
end
