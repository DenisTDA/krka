class CreatePersons < ActiveRecord::Migration[7.0]
  def change
    create_table :persons do |t|
      t.string :name
      t.string :lastname
      t.string :sername
      t.belongs_to :pharmacy, foreign_key: true

      t.timestamps
    end
  end
end
