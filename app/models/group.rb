class Group < ApplicationRecord
  belongs_to :user
  has_many   :participants, dependent: :destroy

  def all_matched
    self.participants.each do |participant|
      if participant.giftee.blank?
        return false
      end
      true
    end
  end
end
