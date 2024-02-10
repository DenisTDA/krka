class CreateMedicines < ActiveRecord::Migration[7.0]
  def change
    create_table :medicines do |t|
      t.string :title
      t.string :type
      t.integer :capacity
      t.string :units
      t.string :vareity
      t.string :extras

      t.timestamps
    end
  end
end
