class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :sex
      t.text :medical_notes
      t.references :provider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
