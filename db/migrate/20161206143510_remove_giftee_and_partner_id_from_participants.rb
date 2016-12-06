class RemoveGifteeAndPartnerIdFromParticipants < ActiveRecord::Migration[5.0]
  def change
    remove_column :participants, :giftee_id, :integer
    remove_column :participants, :partner_id, :integer
  end
end
