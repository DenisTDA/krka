class CreateAdresses < ActiveRecord::Migration[7.0]
  def change
    create_table :adresses do |t|
      t.string :city
      t.string :street
      t.integer :building
      t.string :part

      t.timestamps
    end
  end
end
