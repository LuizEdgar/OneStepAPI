class CreateEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :educations do |t|
      t.string :degree
      t.string :field
      t.string :activities
      t.string :description
      t.references :volunteer, foreign_key: true

      t.timestamps
    end
  end
end
