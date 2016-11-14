# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  is_admin               :boolean          default(FALSE)
#  nameChi                :string
#  nameNick               :string
#  image                  :string
#  gender                 :string
#  birthday               :integer
#  cellNum                :integer
#  income                 :integer
#  heightUser             :integer
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  
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
