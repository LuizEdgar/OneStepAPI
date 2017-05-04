class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :cnpj
      t.string :site
      t.string :about
      t.string :mission
      t.integer :size
      t.boolean :verified, default: false
      t.date :established_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
