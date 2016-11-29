# == Schema Information
#
# Table name: photos
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  avatar        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  photo_type    :string
#  photo_id      :integer
#  restaurant_id :integer
#

class Photo < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :photoable, polymorphic: true
end
