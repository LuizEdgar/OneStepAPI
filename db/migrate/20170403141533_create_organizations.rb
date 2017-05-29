class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.string :cnpj
      t.string :site
      t.text :about
      t.text :mission
      t.integer :size
      t.boolean :verified, default: false
      t.date :established_at
      t.references :user, foreign_key: true
      t.references :profile_image, foreign_key: { to_table: :images, on_delete: :cascade } 

      t.timestamps
    end
  end
end
