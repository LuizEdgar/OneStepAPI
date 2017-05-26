class CreateFeedItems < ActiveRecord::Migration[5.0]
  def change
    create_table :feed_items do |t|
      t.references :feedable, polymorphic: true

      t.timestamps
    end
  end
end
