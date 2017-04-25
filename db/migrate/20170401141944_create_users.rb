class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :username, null: false
      t.string :email
      t.string :facebook_id
      t.integer :kind, null: false
      t.string :auth, null: false
      t.string :password_digest

      t.timestamps
    end
  end
end
