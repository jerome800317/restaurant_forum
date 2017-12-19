class User < ApplicationRecord
  def admin?
    self.role == "admin"
  end

  mount_uploader :image, PhotoUploader

  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
