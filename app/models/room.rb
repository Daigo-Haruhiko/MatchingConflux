class Room < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :messages, dependent: :destroy
  validates :user_id, presence: true
  validates :company_id, presence: true
end
