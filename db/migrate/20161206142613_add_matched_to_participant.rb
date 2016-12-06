class AddMatchedToParticipant < ActiveRecord::Migration[5.0]
  def change
    add_column :participants, :matched, :boolean, default: false, null: false
  end
end
