class CreateJoinTableCauseOpportunity < ActiveRecord::Migration[5.0]
  def change
    create_join_table :causes, :opportunities do |t|
      # t.index [:cause_id, :opportunity_id]
      # t.index [:opportunity_id, :cause_id]
    end
  end
end
