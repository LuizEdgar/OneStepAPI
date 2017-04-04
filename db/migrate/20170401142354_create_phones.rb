class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.string :number, null: false
      t.integer :kind, default: 0 # 0 = other
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
