class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :facebook_id
      t.string :auth, null: false
      t.string :password_digest, null: false
      t.integer :kind, null: false

      t.timestamps
    end
  end
end
