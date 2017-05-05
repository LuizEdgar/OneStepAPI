class CreateVolunteers < ActiveRecord::Migration[5.0]
  def change
    create_table :volunteers do |t|
      t.string :name, null: false
      t.date :birth_at
      t.string :about
      t.string :occupation
      t.integer :gender, default: 0 # 0 = other
      t.integer :period_availability
      t.boolean :volunteered
      t.string :cpf
      t.string :rg
      t.boolean :verified, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
