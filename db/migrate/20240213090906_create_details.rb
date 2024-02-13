class CreateDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :details do |t|
      t.string :title
      t.integer :age
      t.string :phone
      t.string :email, null: false
      t.index :email, unique: true # Add index on email column for quicker lookups
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
