class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :country
      t.string :postcode
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end