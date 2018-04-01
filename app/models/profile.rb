class Profile < ApplicationRecord
  validates :company_id, presence: true
  validates :salary, presence: true
  validates :phone, presence: true, format: { with: /\A\d{10}$|^\d{11}\z/ }
  validates :description, presence: true
  validates :image, presence: true
  validates :address, presence: true
  mount_uploader :image, AvatarUploader

  belongs_to :company
  belongs_to :user, optional: true
  has_many :profile_favorites, dependent: => :destroy
  has_many :profile_favorite_companies, through: :profile_favorites, source: 'company'
  has_many :profile_favorite_users, through: :profile_favorites, source: 'user'


  has_many :profile_comments, dependent: => :destroy
end
