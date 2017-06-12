class EventToUser < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates_uniqueness_of :user_id
end
