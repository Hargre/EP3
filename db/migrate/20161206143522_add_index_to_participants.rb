class AddIndexToParticipants < ActiveRecord::Migration[5.0]
  def change
    add_column :participants, :partner_id, :integer
    add_index :participants, :partner_id
    add_column :participants, :giftee_id, :integer
    add_index :participants, :giftee_id
  end
end
