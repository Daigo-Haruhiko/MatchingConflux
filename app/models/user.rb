class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, uniqueness: true

  mount_uploader :avatar, AvatarUploader

  has_many :topics
  has_many :topic_favorites, dependent: :destroy
  has_many :topic_favorite_topics, through: :topic_favorites, source: 'topic'

  has_many :topic_comments
end
