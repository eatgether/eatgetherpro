class Feedback < ApplicationRecord
	mount_uploader :image, ImageUploader
	belongs_to :user
	belongs_to :order_two
end
