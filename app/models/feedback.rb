# == Schema Information
#
# Table name: feedbacks
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  image        :string
#  user_id      :integer
#  order_two_id :integer
#  rating       :integer
#

class Feedback < ApplicationRecord
	mount_uploader :image, ImageUploader
	belongs_to :user
	belongs_to :order_two

	scope :recent, -> {order("created_at DESC")}
end
