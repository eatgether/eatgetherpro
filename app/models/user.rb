class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
	has_many :feedbacks

  mount_uploader :image, ImageUploader
  scope :all_except, -> (user) {where.not(id: user)}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def admin?
     is_admin
  end

  def take_master!
    self.is_admin = true
    self.save
  end

  def customer!
    self.is_admin = false
    self.save
  end

  has_many :posts

end
