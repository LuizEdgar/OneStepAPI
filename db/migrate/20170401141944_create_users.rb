class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :facebook_id, null: false
      t.integer :kind, null: false
      t.string :auth, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
