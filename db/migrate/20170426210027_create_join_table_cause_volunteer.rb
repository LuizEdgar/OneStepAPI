class CreateJoinTableCauseVolunteer < ActiveRecord::Migration[5.0]
  def change
    create_join_table :causes, :volunteers do |t|
      # t.index [:cause_id, :volunteer_id]
      # t.index [:volunteer_id, :cause_id]
    end
  end
end
