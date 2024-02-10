class CreatePharmacies < ActiveRecord::Migration[7.0]
  def change
    create_table :pharmacies do |t|
      t.integer :number
      t.belongs_to :adress, index: { unique: true }, foreign_key: true
      t.string :inn

      t.timestamps
    end
  end
end
