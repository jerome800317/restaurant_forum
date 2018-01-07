class User < ApplicationRecord
  def admin?
    self.role == "admin"
  end

  def following?(user)
    self.followings.include?(user)
  end

  mount_uploader :avatar, PhotoUploader

  validates_presence_of :name

  has_many :comments
  has_many :restaurants, through: :comments

  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant

  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant

  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships

  has_many :inverse_followships, class_name: "Followships", foriegn_key: "following_id",dependent: :destroy
  has_many :followers, through: :inverse_followships, source: :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
