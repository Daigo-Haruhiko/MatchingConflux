class ProfileFavorite < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :profile
  belongs_to :user, optional: true
  validates :user_id, presence: true, if: -> { company_id.blank? }
  validates :company_id, presence: true, if: -> { user_id.blank? }
  validates :profile_id, presence: true
end
