class CreateJoinTableOpportunitySkill < ActiveRecord::Migration[5.0]
  def change
    create_join_table :opportunities, :skills do |t|
      # t.index [:opportunity_id, :skill_id]
      # t.index [:skill_id, :opportunity_id]
    end
  end
end
