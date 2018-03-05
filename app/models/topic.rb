class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :salary, presence: true
  validates :phone, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :college, presence: true
  validates :address, presence: true 

  mount_uploader :image, AvatarUploader

  belongs_to :user
  belongs_to :company, optional: true
  has_many :topic_favorites, dependent: :destroy, validate: :false
  has_many :topic_favorite_users, through: :topic_favorites, source: 'user'
  has_many :topic_favorite_companies, through: :topic_favorites, source: 'company'

  has_many :topic_comments
end
