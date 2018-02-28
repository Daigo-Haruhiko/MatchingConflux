class ProfileComment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :company, optional: true
  belongs_to :profile
  validates :comment, presence: true
  validates :user_id, presence: true, if: -> { company_id.blank? }
  validates :company_id, presence: true, if: -> { user_id.blank? }
end
