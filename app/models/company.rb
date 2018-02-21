class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, uniqueness: true

  mount_uploader :image, AvatarUploader

  has_many :profiles
  has_many :profile_favorites, dependent: :destroy
  has_many :profile_favorite_profiles, through: :profile_favorites, source: 'profile'

  has_many :profile_comments
end
