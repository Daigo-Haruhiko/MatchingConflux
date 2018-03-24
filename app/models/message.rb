class Message < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :company, optional: true
  belongs_to :room
  validates :user_id, presence: true, if: -> { company_id.blank? }
  validates :company_id, presence: true, if: -> { user_id.blank? }
  validates :room_id, presence: true
  validates :content, presence: true
  after_create_commit { MessageBroadcastJob.perform_later self }
end
