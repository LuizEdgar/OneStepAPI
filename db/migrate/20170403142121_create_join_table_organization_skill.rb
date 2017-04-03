class CreateJoinTableOrganizationSkill < ActiveRecord::Migration[5.0]
  def change
    create_join_table :organizations, :skills do |t|
      # t.index [:organization_id, :skill_id]
      # t.index [:skill_id, :organization_id]
    end
  end
end
