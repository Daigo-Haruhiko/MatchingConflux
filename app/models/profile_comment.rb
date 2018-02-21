class ProfileComment < ApplicationRecord
  validates :comment, presence: true

  belongs_to :company
  belongs_to :profile
end
