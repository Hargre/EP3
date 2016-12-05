class Participant < ApplicationRecord
  belongs_to :group
  validates_presence_of :name, :email, :group_id
end
