class Participant < ApplicationRecord
  belongs_to :group
  belongs_to :partner,
              foreign_key: 'partner_id',
              class_name: 'Participant',
              optional: true
  belongs_to :giftee,
              foreign_key: 'giftee_id',
              class_name: 'Participant',
              optional: true

  validates_presence_of :name, :email, :group_id

  class << self
    def matchable(group:, participant:)
      if participant.partner_id.present?
        where.not(id: participant.id, partner_id: participant.partner_id).where(matched: false, group_id: participant.group_id)
      else
        where.not(id: participant.id).where(matched: false, group_id: participant.group_id)
      end
    end
  end
end
