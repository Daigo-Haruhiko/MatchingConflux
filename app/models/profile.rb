class Profile < ApplicationRecord
  validates :company_id, presence: true
  validates :salary, presence: true
  validates :phone, presence: true
  validates :description, presence: true
  validates :image, presence: true
  mount_uploader :image, AvatarUploader

  belongs_to :company
end