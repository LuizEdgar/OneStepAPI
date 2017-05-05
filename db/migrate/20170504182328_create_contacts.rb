class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.references :contactable, polymorphic: true

      t.timestamps
    end
  end
end
