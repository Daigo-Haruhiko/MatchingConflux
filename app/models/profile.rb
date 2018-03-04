class Profile < ApplicationRecord
  validates :company_id, presence: true
  validates :salary, presence: true
  validates :phone, presence: true
  validates :description, presence: true
  validates :image, presence: true
  mount_uploader :image, AvatarUploader

  belongs_to :company
  belongs_to :user, optional: true
  has_many :profile_favorites, dependent: :destroy
  has_many :profile_favorite_companies, through: :profile_favorites, source: 'company'
  has_many :profile_favorite_users, through: :profile_favorites, source: 'user'


  has_many :profile_comments
end
