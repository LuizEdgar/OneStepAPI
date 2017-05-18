class CreateOpportunities < ActiveRecord::Migration[5.0]
  def change
    create_table :opportunities do |t|
      t.string :title
      t.integer :volunteers_number
      t.boolean :is_virtual
      t.boolean :is_ongoing
      t.date :start_date_at
      t.date :end_date_at
      t.time :start_time_at
      t.time :end_time_at
      t.text :description
      t.string :time_commitment
      t.string :others_requirements
      t.string :tags
      t.references :opportunitable, polymorphic: true, index: { name: 'index_opportunities_on_opportunitable_type_and_id' }

      t.timestamps
    end
  end
end