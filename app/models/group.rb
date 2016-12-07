class Group < ApplicationRecord
  belongs_to :user
  has_many   :participants, dependent: :destroy

  validates_presence_of :user_id
  validates :name,  presence: true, length: { maximum: 50 }

  def all_matched
    self.participants.each do |participant|
      if participant.giftee.blank?
        return false
      end
      true
    end
  end
end
