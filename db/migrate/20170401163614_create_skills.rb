class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.string :description

      t.timestamps
    end
  end
end
